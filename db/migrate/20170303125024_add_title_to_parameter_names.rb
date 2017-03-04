class AddTitleToParameterNames < ActiveRecord::Migration[5.0]
  def change
    add_column :parameter_names, :title, :string
  end
end
