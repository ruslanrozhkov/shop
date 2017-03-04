class CreateParameterNames < ActiveRecord::Migration[5.0]
  def change
    create_table :parameter_names do |t|
      t.string :name

      t.timestamps
    end
  end
end
