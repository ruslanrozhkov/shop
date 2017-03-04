module Admin::ProductsHelper
  def picture(id)
    Picture.find(id)
  end
end
