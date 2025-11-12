class OutputResource < ApplicationRecord
  belongs_to :resource
  belongs_to :recipe
end
