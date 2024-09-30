# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "Clearing Database..."
Recipe.destroy_all
Category.destroy_all
puts "Database clear!"

puts "Seeding Database with recipes..."
Recipe.create!([
  {
    name: "Spaghetti Bolognese",
    description: "A classic Italian pasta dish with a rich and savory meat sauce.",
    image_url: "https://example.com/spaghetti-bolognese.jpg",
    rating: 4.5
  },
  {
    name: "Chicken Curry",
    description: "A flavorful and spicy Indian curry with tender chicken pieces.",
    image_url: "https://example.com/chicken-curry.jpg",
    rating: 4.8
  },
  {
    name: "Vegetable Stir-fry",
    description: "A healthy and colorful stir-fry with mixed vegetables and a savory sauce.",
    image_url: "https://example.com/vegetable-stirfry.jpg",
    rating: 4.2
  },
  {
    name: "Chocolate Cake",
    description: "A rich and moist chocolate cake topped with creamy chocolate frosting.",
    image_url: "https://example.com/chocolate-cake.jpg",
    rating: 5.0
  }
])

puts "Added #{Recipe.count} to Database!"
