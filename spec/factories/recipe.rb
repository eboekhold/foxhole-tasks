FactoryBot.define do
  factory :recipe do
    structure

    # Build input and output resources if they are not passed to the factory through the nested attributes params.
    after(:build) do |recipe, evaluator|
      recipe.input_resources = build_list(:input_resource, 1, recipe: recipe) unless evaluator.methods.include?(:input_resources_attributes)
      recipe.output_resources = build_list(:output_resource, 1, recipe: recipe) unless evaluator.methods.include?(:input_resources_attributes)
    end
  end
end
