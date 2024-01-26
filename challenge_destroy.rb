#!/usr/bin/env ruby

# @author   Nigel Abrera
# @date     25th Jan 2024
# @updated  26th Jan 2024

require_relative 'ar.rb'

# Find one of the products you created in challenge_create.rb
# and delete it from the database.
product_created_previously = Product.find_by(name: "Spicy Drink")

if product_created_previously
  product_created_previously.destroy
  puts "Product '#{product_created_previously.name}' is removed from the database."

else
  puts "Product does not exist."
end
