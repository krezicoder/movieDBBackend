# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Create categories
require 'faker'

user = User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: "ravitest@gmail.com", password: "Password123")

100.times do |i|
  user = User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: "Password123")
end

100.times do |i|
  category = Category.create!(:title => Faker::Creature::Animal.name, :description => Faker::Lorem.sentence)
  movie = Movie.new(:title => Faker::Movie.name, :description => Faker::Lorem.sentence)
  movie.category = category
  movie.user_id = i + 1
  movie.save
end


