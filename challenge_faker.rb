#!/usr/bin/env ruby

# @author Nigel Abrera
# @date 20th Jan 2024

require_relative 'ar.rb'

# In a loop user Faker to generate 10 new categories.

10.times do
  category = Category.create(
    name:        Faker::Commerce.department,
    description: Faker::Lorem.sentence
  )

  # Within this same loop use the newly created and saved
  # category objects to generate 10 new products for each category.
  # The name, description, price and quantity of these 10
  # products should also be generated using faker.

  10.times do
    category.products.create(
      name:           Faker::Commerce.product_name,
      description:    Faker::Lorem.sentence,
      price:          Faker::Commerce.price(range: 0..300.0),
      stock_quantity: Faker::Number.between(from: 1, to: 100)
    )
  end
end
