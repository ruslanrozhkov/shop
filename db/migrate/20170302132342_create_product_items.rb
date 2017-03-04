class CreateProductItems < ActiveRecord::Migration[5.0]
  def change
    create_table :product_items do |t|
      t.integer :product_id
      t.integer :parameter_name_id
      t.integer :parameter_value_id

      t.timestamps
    end
  end
end
