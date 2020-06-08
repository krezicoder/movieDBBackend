FactoryBot.define do
  factory :movie, class: Movie do
    title {Faker::Movie.title}
    description {Faker::Lorem.sentence}
    category_id {1}
    user_id {1}
  end
end