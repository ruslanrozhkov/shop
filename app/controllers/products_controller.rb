class ProductsController < ApplicationController
  before_action :set_product

  def show
    size = ParameterName.where(name: 'size')
    color = ParameterName.where(name: 'color')
    @product
    @sizes = @product.parameter_values.where(parameter_name_id: size)
    @colors = @product.parameter_values.where(parameter_name_id: color)
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end
end
