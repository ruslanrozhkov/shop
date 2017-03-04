class Product < ApplicationRecord
  belongs_to :category
  has_many :comments
  has_many :pictures, dependent: :destroy
  has_many :product_items
  has_many :parameter_names, through: :product_items
  has_many :parameter_values, through: :product_items
end
