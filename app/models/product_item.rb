class ProductItem < ApplicationRecord
  belongs_to :product
  belongs_to :parameter_name
  belongs_to :parameter_value
end
