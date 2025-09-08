class CreateSaleItems < ActiveRecord::Migration[7.1]
  def change
    create_table :sale_items do |t|
      t.integer :sale_id
      t.integer :stock_item_id
      t.decimal :quantity
      t.decimal :unit_sale_price

      t.timestamps
    end
    add_foreign_key :sale_items, :sales, column: :sale_id
    add_foreign_key :sale_items, :stock_items, column: :stock_item_id
    add_index :sale_items, :sale_id
    add_index :sale_items, :stock_item_id
  end
end
