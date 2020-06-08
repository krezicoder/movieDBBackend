# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Create categories
require 'faker'


100.times do |i|
  user = User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: "user#{i+1}@gmail.com", password: "Password123")
end
puts "Users Created"

100.times do |i|
  category = Category.create!(:title => "Category #{i+1}", :description => Faker::Lorem.sentence)
  puts "Creating Movies"
  rand(10..20).times do |i|
    movie = Movie.new(:title => Faker::Movie.title, :description => Faker::Lorem.sentence)
    movie.category = category
    movie.user_id =  1#rand(1..100)
    movie.save
    puts "Creating Rating"
    rand(0..30).times do |i|
      rating = Rating.new()
      rating.movie = movie
      rating.user_id = rand(1..100)
      rating.rating_value = rand(1..5)
      rating.save!

    end
  end

end


