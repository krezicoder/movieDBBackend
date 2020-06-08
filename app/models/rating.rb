# == Schema Information
#
# Table name: ratings
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  movie_id   :bigint           not null
#  user_id    :bigint
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
class Rating < ApplicationRecord
  belongs_to :movie
  belongs_to :user, class_name: 'User', optional: true
end
