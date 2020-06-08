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
require 'rails_helper'

RSpec.describe Category, type: :model do

    context "category model validations" do
      let(:category) {build(:category)}

      it 'should have a title' do
        category.title = nil
        expect(category.save).to eq(false)
      end

      it 'should have a description' do
        category.description = nil
        expect(category.save).to eq(false)
      end
    end

    context "associations" do
      it { should have_many(:movies)}

    end
end
