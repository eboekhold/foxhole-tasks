class Resource < ApplicationRecord
  has_many :input_resources
  has_many :output_resources

  has_many :recipes_as_input, through: :input_resources, source: :recipe
  has_many :recipes_as_output, through: :output_resources, source: :recipe

  def recipes
    recipes_as_input + recipes_as_output
  end
end
