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

  # Add a validation to this class such that a product must have all columns
  # (other than foreign keys, the id, or datetime column) filled out
  # before it can be saved to the db.
  validates :name, :description, :price, :stock_quantity, presence: true

  # Research AR validations and add a validation that
  # will ensure that all product names are unique and longer than 3 characters.
  validates :name, uniqueness: true, length: { minimum: 4 }

  # A product has a many to one relationship with a category.
  # The products table has a category_id foreign key.
  # In other words, a product belongs to a category.
  belongs_to :category
end
