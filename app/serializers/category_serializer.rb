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
class CategorySerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :movies_count
  has_many :movies

end
