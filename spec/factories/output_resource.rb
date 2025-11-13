FactoryBot.define do
  factory :output_resource do
    recipe
    resource
    amount { Faker::Number.number(digits: 2) }
  end
end
