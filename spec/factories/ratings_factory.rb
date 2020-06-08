FactoryBot.define do
  factory :rating, class: Rating do
    movie_id {1}
    user_id {1}
    rating_value {3.5}
  end
end