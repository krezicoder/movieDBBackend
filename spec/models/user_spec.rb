# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  first_name             :string
#  last_name              :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
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

  context "model associations" do
    it {should have_many(:movies)}
  end
end
