FactoryBot.define do
  factory :category, class: Category do
    title {Faker::Movies.name}
    description {Faker::Lorem.sentence}
  end
end