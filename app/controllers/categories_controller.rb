class CategoriesController < ApplicationController
  before_action :set_category

  def show
    @products = @category.products.all
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end
end
