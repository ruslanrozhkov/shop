class Admin::ParameterValuesController < AdminController
  before_action :set_parameter_name

  def index
    @parameter_values = @parameter_name.parameter_values.all
  end

  def new
    @parameter_value = @parameter_name.parameter_values.new
  end

  def create
    @parameter_value = @parameter_name.parameter_values.new(parameter_value_params)
    respond_to do |format|
      if @parameter_value.save
        format.html { redirect_to admin_param_values_path(@parameter_name), notice: 'Значение успешно создано' }
      else
        format.html { render :new }
      end
    end
  end

  private

  def set_parameter_name
    @parameter_name = ParameterName.find(params[:param_id])
  end

  def parameter_value_params
    params.require(:parameter_value).permit(:value, :param_id)
  end
end
