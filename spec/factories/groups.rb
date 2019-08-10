FactoryBot.define do
  factory :group do
    title { Faker::Name.name }
    description {"aaa"}
  end
end
