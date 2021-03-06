class Admin::ProductsController < AdminController
  before_action :set_product, only: [:edit, :show, :update, :destroy]

  def index
    @products = Product.all.limit(10)
  end

  def new
    @categories = Category.all
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    respond_to do |format|
      if @product.save
        format.html { redirect_to new_admin_product_item_path(@product), notice: 'Товар успешно добавлен' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
    @categories = Category.all
  end

  def show
    size = ParameterName.where(name: 'size')
    color = ParameterName.where(name: 'color')
    @sizes = @product.parameter_values.where(parameter_name_id: size)
    @colors = @product.parameter_values.where(parameter_name_id: color)
    @picture = @product.picture(@product.picture_id)
  end

  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to admin_products_path, notice: 'Товар успешно обновлен' }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @product.destroy
        format.html { redirect_to admin_products_path, notice: 'Товар удален' }
      else
        format.html { redirect_to admin_products_path, notice: 'Невозможно удалить товар' }
      end
    end
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:id, :category_id, :title, :description, :picture_id, :price)
  end
end
