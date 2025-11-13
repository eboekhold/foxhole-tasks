# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

salvage = FactoryBot.create(:resource, name: "Salvage")
component = FactoryBot.create(:resource, name: "Component")
sulfur = FactoryBot.create(:resource, name: "Sulfur")
coal = FactoryBot.create(:resource, name: "Coal")
bmat = FactoryBot.create(:resource, name: "Basic Material", alias: "bmat")
emat = FactoryBot.create(:resource, name: "Explosive Powder", alias: "emat")
hemat = FactoryBot.create(:resource, name: "Heavy Explosive Powder", alias: "hemat")
rmat = FactoryBot.create(:resource, name: "Refined Material", alias: "rmat")
diesel = FactoryBot.create(:resource, name: "Diesel")
refinery = FactoryBot.create(:structure, name: "Refinery")
FactoryBot.create(:recipe, structure: refinery, time: 40000, input_resources_attributes: [{resource: component, amount: 20}], output_resources_attributes: [{resource: rmat, amount: 1}])
FactoryBot.create(:recipe, structure: refinery, time: 12000, input_resources_attributes: [{resource: salvage, amount: 10}], output_resources_attributes: [{resource: diesel, amount: 1}])
FactoryBot.create(:recipe, structure: refinery, time: 480, input_resources_attributes: [{resource: salvage, amount: 2}], output_resources_attributes: [{resource: bmat, amount: 1}])
FactoryBot.create(:recipe, structure: refinery, time: 9375, input_resources_attributes: [{resource: salvage, amount: 5}], output_resources_attributes: [{resource: emat, amount: 1}])
FactoryBot.create(:recipe, structure: refinery, time: 15000, input_resources_attributes: [{resource: sulfur, amount: 5}], output_resources_attributes: [{resource: hemat, amount: 1}])
