#!/usr/bin/env ruby

# @author Nigel Abrera
# @date   20th Jan 2024

require_relative 'ar.rb'

number_of_products = Product.count

puts "\nThere are #{number_of_products} in the products table.\n\n"

# Use the Product class to find (any) product from the database.
first_product = Product.find(226)
puts "\nThe product that was found using a specific id is #{first_product.name}.\n"

# Inspect the Product object you have retrieved.
puts "\n#{first_product.inspect}\n\n"

# In a comment within your product.rb file,
# record all the columns that exist in the products table.

# Pasted the comment in the product.rb
  # Product table's columns
  # id
  # name
  # description
  # price
  # stock quantity
  # category_id
  # create_at
  # updated_at
#

# Based on the columns you find,
# can you determine if the products table has an
# association with any other tables? If so, what table?

# Based on the columns found in the product table, I have determined by checking
# the other tables such as category, customer, and province, that the Products table
# has  one to many associations to the category table which the product table contains
# a foreign key of category id.

# Use ActiveRecord to find and print out:
# Total number of products
puts "Total number of products is #{number_of_products}.\n\n"

# The names of all products above $10 with names that begin with the letter C.
product_above_10dollars = Product.where('price > 10 AND name LIKE "C%"')

# Foreach loops and prints out the name of the products retrieved.
product_above_10dollars.each { |i| puts i.name }
puts "\n"

# Total number of products with a low stock quantity.
# (Low is defined as less than 5 in stock.)
products_low_stock = Product.where('stock_quantity < 5').count

puts "\nTotal number of products that are low in quantity is #{products_low_stock}."

# Add to the challenge_read.rb file:

# Find the name of the category associated with one of the products you have found.
# (You should do this without referencing the products foreign key value.
# Use the product's "belongs to" association instead.)
puts "\n"
puts "The categoies name associated with\s
the product I retrieved is #{first_product.category.name}.".delete("\n")
puts "\n"
# Find a specific category and use it to build and persist
# a new product associated with this category.
# (You should do this without manually setting the products foreign key.
# Look at the end of this example file to see how to build an ActiveRecord object
# by way of an "has many" association.)

# TODO: Uncomment this code below before submission!
first_category = Category.find(2)

new_product = first_category.products.build(name:           "Spicy Drink",
                                            description:    "24 - 15 oz bottles",
                                            price:          230,
                                            stock_quantity: 23)

new_product.save

puts "\n#{new_product.inspect}\n\n"

# Find a specific category and then use it to locate all the the
# associated products over a certain price.

expensive_product = first_category.products.where("price > 20")

expensive_product.each do |product|
  puts "Name: #{product.name},
  \b\b\bPrice: #{product.price}\n"
end

puts "\nThese are expensive! \n\n"
