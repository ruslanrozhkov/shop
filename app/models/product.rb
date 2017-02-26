class Product < ApplicationRecord
  belongs_to :category
  has_many :comments
  has_many :pictures, dependent: :destroy
end
