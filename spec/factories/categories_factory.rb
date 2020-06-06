FactoryBot.define do
  factory :category, class: Category do
    title {Faker::Movie.title}
    description {Faker::Lorem.sentence}
  end
end