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

    leftover_time = time % (1000 * 60 * 60)

    minutes = (leftover_time / (1000 * 60)).to_s.rjust(2, '0')

    leftover_time = leftover_time % (1000 * 60)

    seconds = (leftover_time / 1000).to_s.rjust(2, '0')

    milliseconds = (leftover_time % 1000).to_s.rjust(3, '0')

    output = "#{hours}:#{minutes}:#{seconds}"
    output += ".#{milliseconds}" unless time % 1000 == 0

    output
  end
end
