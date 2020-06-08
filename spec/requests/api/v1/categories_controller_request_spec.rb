require 'rails_helper'

RSpec.describe "Api::V1::CategoriesController", type: :request do

  describe "get api/v1/categories" do
    let(:categories) {create_list(:category, 50)}
    let(:category) {create(:category)}

    it 'should respond with list of categories with default 10 per page' do
      categories
      get api_v1_categories_path
      expect(json["data"].count).to eq(10)
    end


    it "should return page 2 with page_size 1 item" do
      categories
      get api_v1_categories_path, :params => { :page => {:number => 2}, :page => {:size => 1}}
      expect(json["data"].count).to eq(1)
    end
  end


  describe "get api/v1/categories/1" do
    let(:category) {create(:category)}

    it "should show category with category id" do
      category
      get api_v1_category_path(category)
      expect(response).to be_successful
    end
  end

  describe "post api/v1/categories" do


  end


  describe "put api/v1/categories" do


  end


  describe "put/patch api/v1/categories" do


  end


  describe "delete api/v1/categories/:id" do
    let(:category) {create(:category)}

    it "should delete category" do
      category
      expect(Category.all().count).to eq(1)
      delete api_v1_category_path(category)
      expect(Category.all().count).to eq(0)
    end


  end






end
