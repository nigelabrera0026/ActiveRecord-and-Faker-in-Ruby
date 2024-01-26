#!/usr/bin/env ruby

# @author   Nigel Abrera
# @date     25th Jan 2024
# @updated  26th Jan 2024

require_relative 'ar.rb'

# Create three new products using the three different
# ways to create new AR objects.

# First way of creating a product.
new_product = Product.new

# Setting the required properties.
new_product.name = "Garlic Chili Oil"
new_product.description = "10 - 12 oz jars"
new_product.price = 12
new_product.stock_quantity = 34

# Calling save on the object will persist it in the product table.
new_product.save

# The Second way of creating a new product.
second_new_product = Product.new( name:        "Green Onions",
                                  description: "5 - 10 ks pkg.",
                                  price: 23,
                                  stock_quantity: 45 )

# We will need to save the newly created second product.
second_new_product.save

# The third way of creating a new product.
# Here, we don't need to use save because create will persist at all at once.
third_new_product = Product.create( name:          "Chinese Fried Rice",
                                    description:   "20 - 500 g pkgs",
                                    price:          2,
                                    stock_quantity: 34 )


# Ensure that all three new products are persisted to the database,
# without validations errors.

# Create a Product object that is missing some required columns.
new_invalid_product = Product.new(name: "Shrimp rolls")

# Attempt to save this product and print all the AR errors which are generated.
if (new_invalid_product.save)
  puts "New product successfully saved."
  puts new_invalid_product.inspect

else
  puts "There was an error saving the new product to the database."

  # Loop through all the validation errors.
  new_invalid_product.errors.messages.each do |column, errors|
    errors.each do |error|
      puts "The #{column} property #{error}."
    end
  end
end
