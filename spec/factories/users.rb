FactoryBot.define do
  factory :user do
    password = Faker::Internet.password(8)
    nickname { Faker::Name.name }
    email { Faker::Internet.free_email }
    password { password }
    password_confirmation { password }
  end

  factory :takashi, class: User do
    password = Faker::Internet.password(8)
    nickname { "Takashi" }
    email { Faker::Internet.free_email }
    password { password }
    password_confirmation { password }
  end
  factory :satoshi, class: User do
    password = Faker::Internet.password(8)
    nickname { "Satoshi" }
    email { Faker::Internet.free_email }
    password { password }
    password_confirmation { password }
  end
end
