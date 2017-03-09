class ProductsController < ApplicationController
  before_action :set_product

  def show
    size = ParameterName.find_by_name('size')
    color = ParameterName.find_by_name('color')
    @product
    @sizes = @product.parameter_values.where(parameter_name_id: size)
    @colors = @product.parameter_values.where(parameter_name_id: color)
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end
end
