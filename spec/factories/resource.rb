FactoryBot.define do
  factory :resource do
    name { Faker::Construction.material }
  end
end
