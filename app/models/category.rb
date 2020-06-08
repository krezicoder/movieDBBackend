# == Schema Information
#
# Table name: categories
#
#  id          :bigint           not null, primary key
#  description :string
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Category < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  has_many :movies

  def movies_count
    self.movies.count
  end
end
