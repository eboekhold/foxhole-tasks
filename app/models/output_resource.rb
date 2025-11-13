class OutputResource < ApplicationRecord
  belongs_to :resource
  belongs_to :recipe

  validates :amount, numericality: { greater_than: 0 }
end
