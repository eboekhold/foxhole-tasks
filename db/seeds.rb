# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).


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
