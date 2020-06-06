FactoryBot.define do
  factory :user, class: User do
    first_name { 'Ravi' }
    last_name { 'D' }
    email { "ravi@d.com" }
    password { "Password123" }
  end

  factory :random_user, class: User do
    first_name {Faker::Name.first_name}
    last_name {Faker::Name.last_name}
    email {Faker::Internet.email}
    password { "Password123" }
  end
end