class Recipe < ApplicationRecord
  belongs_to :structure

  has_many :input_resources
  has_many :output_resources

  has_many :inputs, through: :input_resources, source: :resource
  has_many :outputs, through: :output_resources, source: :resource

  validates :structure, presence: true

  accepts_nested_attributes_for :input_resources
  accepts_nested_attributes_for :output_resources
end
