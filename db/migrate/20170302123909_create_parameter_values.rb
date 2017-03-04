class CreateParameterValues < ActiveRecord::Migration[5.0]
  def change
    create_table :parameter_values do |t|
      t.integer :parameter_name_id
      t.string :value

      t.timestamps
    end
  end
end
