require 'rails_helper'

RSpec.describe User, type: :model do
  context "user model validatiosn" do
    let(:user) {build :random_user}

    it 'should have a valid first_name' do
      user.first_name = nil
      expect(user.save).to eq(false)
    end


    it 'should have a valid last_name' do
      user.last_name = nil
      expect(user.save).to eq(false)
    end


    it 'should have a valid email' do
      user.email = nil
      expect(user.save).to eq(false)
    end

  end

  context "should return full name" do
    let(:user) {build :random_user}

    it "should return full name" do
      user.first_name = "Ravi"
      user.last_name = "Teja"
      expect(user.full_name).to match("Ravi Teja")
    end

    it "should give truncated first and last name" do
      user.first_name = "Ravi "
      user.last_name = "Teja "
      expect(user.full_name).to match("Ravi Teja")
    end

  end
end
