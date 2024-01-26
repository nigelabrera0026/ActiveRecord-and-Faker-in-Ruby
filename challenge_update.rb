#!/usr/bin/env ruby

# @author   Nigel Abrera
# @date     25th Jan 2024
# @updated  26th Jan 2024

require_relative 'ar.rb'

# Find all products with a stock quantity greater than 40.
high_stocked_product = Product.where("stock_quantity > 40")

# Add one to the stock quantity of each of these products.
# and then save these changes to the database.
# update_all saves automatically but skips validations!
high_stocked_product.update_all("stock_quantity = stock_quantity + 1")
