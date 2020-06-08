FactoryBot.define do
  factory :rating, class: Rating do
    movie_id {1}
    user_id {1}
  end
end