class Admin::CategoriesController < ApplicationController
  before_action :set_category, only: [:edit, :update, :destroy]

  def index
    @categories = Category.all.limit(10)
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.create(category_params)
    respond_to do |format|
      if @category.save
        format.html { redirect_to admin_categories_path, notice: 'Категория успешно создана' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to admin_categories_path, notice: 'Категория успешно обновлена' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @category.destroy
        format.html { redirect_to admin_categories_path, notice: 'Категория удалена' }
      else
        format.html { redirect_to admin_categories_path, notice: 'Невозможно удалить категорию' }
      end
    end
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
