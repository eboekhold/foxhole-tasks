class Recipe < ApplicationRecord
  belongs_to :structure

  has_many :input_resources
  has_many :output_resources

  has_many :inputs, through: :input_resources, source: :resource
  has_many :outputs, through: :output_resources, source: :resource

  validates :structure, presence: true
  validates :time, numericality: { greater_than: 0 }
  validates :faction, presence: true, inclusion: { in: %w[wardens colonials both], message: "%{value} must be 'wardens', 'colonials', or 'both'." }

  accepts_nested_attributes_for :input_resources
  accepts_nested_attributes_for :output_resources

  def time_formatted
    hours = (time / (1000 * 60 * 60)).to_s.rjust(2, '0')
    minutes = (time / (1000 * 60)).to_s.rjust(2, '0')
    seconds = (time / 1000).to_s.rjust(2, '0')
    milliseconds = time % 1000

    output = "#{hours}:#{minutes}:#{seconds}"
    output += ".#{milliseconds}" unless milliseconds == 0

    output
  end
end
