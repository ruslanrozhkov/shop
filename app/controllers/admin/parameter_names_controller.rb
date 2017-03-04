class Admin::ParameterNamesController < AdminController

  def index
    @parameter_names = ParameterName.all
  end

  def new
    @parameter_name = ParameterName.new
  end

  def create
    @parameter_name = ParameterName.new(parameter_name_params)
    respond_to do |format|
      if @parameter_name.save
        format.html { redirect_to admin_params_path, notice: 'Параметр успешно добавлен' }
      else
        format.html { render :new }
      end
    end
  end

  private

  def parameter_name_params
    params.require(:parameter_name).permit(:name, :title)
  end
end
