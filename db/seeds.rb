# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).


# Create resources that have aliases manually so we can find them later
FactoryBot.create(:resource, name: "Basic Materials", alias: "bmat")
FactoryBot.create(:resource, name: "Explosive Powder", alias: "emat")
FactoryBot.create(:resource, name: "Heavy Explosive Powder", alias: "hemat")
FactoryBot.create(:resource, name: "Refined Materials", alias: "rmat")



# ===================================================
# == Populate the database with the datamined data ==
# ===================================================


# == Refinery recipes ==

refinery = FactoryBot.create(:structure, name: "Refinery")

refinery_json = CSV.table('data/v61_items_refinery.csv').map(&:to_hash)

refinery_json.each do |recipe|
  input_resource = Resource.find_or_create_by!(name: recipe[:source_item_name])
  input_amount = 1 / recipe[:yieldmodifier]

  output_resource = Resource.find_or_create_by!(name: recipe[:refined_item_name])
  output_amount = 1

  # (60 / yieldmod) / speedmod = timer_in_s
  time_in_ms = ((60.0 / recipe[:yieldmodifier]) / recipe[:speedmodifier]) * 1000

  FactoryBot.create(:recipe, 
    structure: refinery, 
    time: time_in_ms, 
    input_resources_attributes: [{ resource: input_resource, amount: input_amount }],
    output_resources_attributes: [{ resource: output_resource, amount: output_amount }]
  )
end


# == Factory recipes ==

factory = FactoryBot.create(:structure, name: "Factory")

factory_json = CSV.table('data/v61_items_factory.csv').map(&:to_hash)

factory_json.each do |recipe|
  faction = "both"
  faction = "wardens" if recipe[:faction_variant]&.downcase&.include? "warden"
  faction = "colonials" if recipe[:faction_variant]&.downcase&.include? "colonial"

  input_resources_attributes = []

  # Go over all the possible inputs a factory recipe can have and put them in the inputs.
  %i[bmat emat hemat rmat].each do |resource_alias|
    amount = recipe[resource_alias]
    next unless amount.present?

    input_resource = Resource.find_by!(alias: resource_alias)
    input_resources_attributes << { resource: input_resource, amount: amount }
  end

  output_resource = Resource.find_or_create_by!(name: recipe[:name])
  output_amount = recipe[:quantitypercrate]

  time_in_ms = recipe[:crateproductiontime] * 1000

  FactoryBot.create(:recipe,
    structure: factory,
    faction: faction,
    time: time_in_ms,
    input_resources_attributes: input_resources_attributes,
    output_resources_attributes: [{ resource: output_resource, amount: output_amount }]
  )
end

# Update 1.62 changes: https://foxhole.wiki.gg/wiki/Update_1.62#Balance_Changes
smoke = Resource.find_by!(name: "PT-815 Smoke Grenade")
smoke_recipe = smoke.recipes.first
smoke_recipe.input_resources.first.update_attribute!(:amount, 80)
smoke_recipe.output_resources.first.update_attribute!(:amount, 15)
