class Product < ApplicationRecord
  belongs_to :category
  has_many :comments
  has_many :pictures, dependent: :destroy
  has_many :product_items
  has_many :parameter_names, through: :product_items
  has_many :parameter_values, through: :product_items

  def picture(picture_id)
    Picture.find(picture_id) if picture_id.present?
  end
end
