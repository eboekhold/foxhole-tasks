json.structure recipe.structure.name
json.inputs do
  json.array! recipe.input_resources, partial: "input_resources/input_resource", as: :input_resource
end
json.outputs do
  json.array! recipe.output_resources, partial: "output_resources/output_resource", as: :output_resource
end
