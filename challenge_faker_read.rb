#!/usr/bin/env ruby

# @author Nigel Abrera
# @date 20th Jan 2024

require_relative 'ar.rb'

# Find all the categories in the database
# (including those that you added using Faker).
all_categories = Category.all

puts "\nListing all categories include data generated by Faker.\n\n"

all_categories.each do |category|
  puts "Category ID: #{category.id},
  \b\bName: #{category.name},
  \b\bDescription: #{category.description}"
end

# Display all category names and their associated products.
# (name and price) in a nicely formatted list.
puts "\nDisplaying all category names and their associated products.\n\n"

# using .includes() to pass :products to the specific category to be listed.
Category.includes(:products).find_each do |category|
  puts "\nCategory: #{category.name}"

  # Printing out all the products associated with the category.
  puts (category.products.map { |product| "Product: #{product.name}, Price: #{product.price}" })
end
