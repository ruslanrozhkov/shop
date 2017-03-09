class CategoriesController < ApplicationController
  before_action :set_category

  def show
    @categories = Category.all
    @products = @category.products.all
    size = ParameterName.find_by_name('size')
    color = ParameterName.find_by_name('color')
    @sizes = size.parameter_values
    @colors = color.parameter_values

  end

  private

  def set_category
    @category = Category.find(params[:id])
  end
end
