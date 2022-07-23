class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :cod_product
      t.string :name
      t.string :laboratory
      t.integer :quantity, default: 0
      t.float :sale_price, default: 0

      t.timestamps
    end
    add_index :products, :cod_product, unique: true
    add_index :products, :name, unique: true
  end
end
