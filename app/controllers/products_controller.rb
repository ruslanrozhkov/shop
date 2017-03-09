class ProductsController < ApplicationController
  before_action :set_product

  def show
    @product
    @categories = Category.all
    size = ParameterName.find_by_name('size')
    color = ParameterName.find_by_name('color')
    @sizes = size.parameter_values
    @colors = color.parameter_values
    @product_sizes = @product.parameter_values.where(parameter_name_id: size)
    @product_colors = @product.parameter_values.where(parameter_name_id: color)
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end
end
