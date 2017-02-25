class Admin::ProductsController < ApplicationController
  def index
    @products = Product.all.limit(10)
  end

  def new
    @categories = Category.all
    @product = Product.new
  end

  def create
    @product = Product.create(product_params)
    respond_to do |format|
      if @product.save
        format.html { redirect_to admin_products_path, notice: 'Товар добавлен успешно' }
      else
        format.html { render :new }
      end
    end
  end

  private

  def product_params
    params.require(:product).permit(:category_id, :title, :description)
  end
end
