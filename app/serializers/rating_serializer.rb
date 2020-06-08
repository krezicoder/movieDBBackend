# == Schema Information
#
# Table name: ratings
#
#  id           :bigint           not null, primary key
#  rating_value :float
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  movie_id     :bigint           not null
#  user_id      :bigint
#
# Indexes
#
#  index_ratings_on_movie_id  (movie_id)
#  index_ratings_on_user_id   (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (movie_id => movies.id)
#  fk_rails_...  (user_id => users.id)
#
class RatingSerializer < ActiveModel::Serializer
  attributes :id, :rating_value
  has_one :movie
  has_one :user
end
