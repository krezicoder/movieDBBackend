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
require 'rails_helper'

RSpec.describe Rating, type: :model do
  context "validate associations" do
    it {should belong_to(:user).optional}
    it {should belong_to(:movie)}
  end

  context "validate attributes" do
    let!(:category) {create :category}
    let!(:user) {create :user}
    let(:movie) {build :movie}
    let(:rating) {build :rating}


    it "should have movie" do
      rating
      rating.movie_id = nil
      expect(rating).to_not be_valid
    end

    it "may not have a user" do
      movie.user = user
      movie.category = category
      movie.save
      rating
      rating.movie = movie
      rating.user_id = nil
      expect(rating).to be_valid
    end

    it {should validate_presence_of(:rating_value)}
    it {should validate_numericality_of(:rating_value).is_less_than_or_equal_to(5)}
    it {should validate_numericality_of(:rating_value).is_greater_than_or_equal_to(0)}

  end
end
