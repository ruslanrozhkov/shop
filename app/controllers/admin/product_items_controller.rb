class Admin::ProductItemsController < AdminController
  before_action :set_product

  def index
  end

  def new
    @parameter_names = ParameterName.all
    @product_item = ProductItem.new
  end

  def create
    respond_to do |format|
      params[:product_item]['parameter_value_id'].each do |param_value|
       if (@parameter_value = ParameterValue.find(param_value))
         @product_item = ProductItem.new(
            product_id: @product.id,
            parameter_name_id: @parameter_value.parameter_name_id,
            parameter_value_id: @parameter_value.id
         )
         @product_item.save
       end
      end
      format.html { redirect_to new_admin_product_picture_path(@product), notice: 'Характеристики добавлены' }
    end
  end


  private

  def set_product
    @product = Product.find(params[:product_id])
  end

  def product_item_params
    params.require(:product_item).permit(:product_id, :parameter_name_id, :parameter_value_id)
  end

end
