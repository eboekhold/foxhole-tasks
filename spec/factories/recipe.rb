FactoryBot.define do
  factory :recipe do |recipe|
    structure

    inputs { build_list :resource, 1 }
    outputs { build_list :resource, 1 }
  end
end
