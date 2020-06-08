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
require 'rails_helper'

RSpec.describe Movie, type: :model do
  describe "Movie associations" do
    let(:movie) {build(:movie)}
    it "should belong to user" do
      should belong_to(:user)
    end

    it "should belong to category" do
      should belong_to(:category)
    end

    it {should have_many(:ratings)}

  end

  describe "movie validations" do
    let(:movie) {build :movie}

    it "should have a title" do
      movie
      movie.title = nil
      expect(movie).to_not be_valid
    end

    it "should have a description" do
      movie
      movie.description = nil
      expect(movie).to_not be_valid
    end

    it "should have a user" do
      movie
      movie.user = nil
      expect(movie).to_not be_valid
    end
    it "should have a category" do
      movie
      movie.category = nil
      expect(movie).to_not be_valid
    end

  end
end
