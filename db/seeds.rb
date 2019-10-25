# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "\nCreating 20 ingredients...\n"

INGREDIENTS_URL = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'.freeze
ingredients_json = open(INGREDIENTS_URL).read
DESCRIPTIONS = %w[5cl 2cl 2l 5tbsp 10tn 420g].freeze

def five_doses
  5.times do
    Dose.create(description: descriptions.sample, cocktail: Cocktail, ingredient: Ingredient.all.sample)
  end
end

ingredients = JSON.parse(ingredients_json)
random_ingredient = ingredients['drinks'].take(20)
random_ingredient.each do |ing|
  Ingredient.create(name: ing['strIngredient1'])

end

puts '==========================='
puts '𝌏 All Ingredients Created𝌏'
puts "===========================\n\n\n"

require 'faker'

puts "Generating 20 random cocktail names\n"
20.times do
  name = "#{Faker::Color.color_name.capitalize} #{Faker::Ancient.god} "
  new_cocktail = Cocktail.create(name: name)
  5.times do
  Dose.create(description: DESCRIPTIONS.sample, cocktail: new_cocktail, ingredient: Ingredient.all.sample)
  end
end

puts '========================='
puts '𝌏 All Cocktails Created𝌏'
puts "==========================\n\n\n"

