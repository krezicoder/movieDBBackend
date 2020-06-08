# == Schema Information
#
# Table name: movies
#
#  id          :bigint           not null, primary key
#  description :text
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :bigint           not null
#  user_id     :bigint           not null
#
# Indexes
#
#  index_movies_on_category_id  (category_id)
#  index_movies_on_user_id      (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (category_id => categories.id)
#  fk_rails_...  (user_id => users.id)
#
class Movie < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true

  belongs_to :category
  belongs_to :user
  has_many :ratings

  def avg_rating
    avg = self.ratings.average(:rating_value)
    avg ? avg.round(1) : 0
  end
end
