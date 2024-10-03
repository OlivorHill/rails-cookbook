# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require "faker"
require "json"
require "open-uri"


puts "Clearing Database...."
Bookmark.destroy_all # Needs to be destroyed first
Category.destroy_all
Recipe.destroy_all
puts "Database cleared!"
puts "............"
puts "Creating Categories, Bookmarks and Recipes...."


categories = [ "Breakfast", "Seafood", "Pasta", "Dessert" ] # Categories to iterate over

def recipe_builder(id)
  url = "https://www.themealdb.com/api/json/v1/1/lookup.php?i=#{id}"
  meal_serialized = URI.parse(url).read
  meal = JSON.parse(meal_serialized)["meals"][0]

  Recipe.create!(
    name: meal["strMeal"],
    description: meal["strInstructions"],
    image_url: meal["strMealThumb"],
    rating: rand(2..5.0).round(1)
  )
end

categories.each do | category |                                            # Looping over each Category
  url = "https://www.themealdb.com/api/json/v1/1/filter.php?c=#{category}" # Doing an API call on each of the categories
  recipes_serialized = URI.parse(url).read                                 # Parsing JSON to get back an array of meals
  recipes = JSON.parse(recipes_serialized)                                 # Assigning the array of meals to a variable

  recipes["meals"].take(5).each do | recipe |                              # Iterate over each of the meals
    recipe_builder(recipe["idMeal"])                                       # Calls the above method using the meal id as a parameter
  end
end

puts "Database population complete!"







# categories = [ Category.create!(name: "Indian"),
#               Category.create!(name: "Fusion"),
#               Category.create!(name: "Italian"),
#               Category.create!(name: "French") ]
# 4.times do
#   r = Recipe.create!(
#     name: Faker::Food.dish,
#     description: Faker::Food.description,
#     image_url: Faker::LoremFlickr.image,
#     rating: rand(1..9).to_f + [ 0, 0.5 ].sample,
#   )
#   b = Bookmark.new(comment: Faker::Lorem.paragraph(sentence_count: 1), recipe: r, category: categories.sample)
#   b.save!
# end
