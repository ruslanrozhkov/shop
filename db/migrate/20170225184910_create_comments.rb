class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.integer :product_id
      t.string :email
      t.string :name
      t.text :message

      t.timestamps
    end
  end
end
