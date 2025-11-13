FactoryBot.define do
  factory :input_resource do
    recipe
    resource
    amount { Faker::Number.number(digits: 3) }
  end
end
