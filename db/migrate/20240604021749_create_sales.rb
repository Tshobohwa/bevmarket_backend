class CreateSales < ActiveRecord::Migration[7.1]
  def change
    create_table :sales do |t|
      t.integer :stock_item_id
      t.decimal :quantity
      t.decimal :unit_sale_price

      t.timestamps
    end
    add_foreign_key :sales, :stock_items, column: :stock_item_id
    add_index :sales, :stock_item_id
  end
end
