class Admin::PicturesController < AdminController
  before_action :set_product

  def index
    @pictures = @product.pictures.all
  end

  def new
    @picture = @product.pictures.new
  end

  def create
    respond_to do |format|
         params[:picture]['image'].each do |img|
           @product.pictures.create(image: img)
         end
      format.html { redirect_to admin_product_path(@product), noticee: 'Изображения загружены' }
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @picture = Picture.find(params[:id])
    respond_to do |format|
      if @picture.destroy
        format.html { redirect_to admin_product_pictures_path(@product), notice: 'Изображение удалено' }
      end
    end
  end

  private

  def set_product
    @product = Product.find(params[:product_id])
  end

  def picture_params
    params.require(:picture).permit(:id, :product_id, :image)
  end

end