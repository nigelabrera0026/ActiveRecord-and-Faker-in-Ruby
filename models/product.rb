class Product < ActiveRecord::Base
  # This AR object is linked with the products table.

  # Product table's columns
  # id
  # name
  # description
  # price
  # stock quantity
  # category_id
  # create_at
  # updated_at

  # A product has a many to one relationship with a category.
  # The products table has a category_id foreign key.
  # In other words, a product belongs to a category.
  belongs_to :category
end
