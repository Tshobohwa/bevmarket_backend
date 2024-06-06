class CreateStockItems < ActiveRecord::Migration[7.1]
  def change
    create_table :stock_items do |t|
      t.integer :item_id
      t.decimal :quantity
      t.decimal :last_unit_buy_price
      t.decimal :reduction_sale_price
      t.decimal :unit_sale_price
      t.decimal :average_unit_buy_price

      t.timestamps
    end
    add_foreign_key :stock_items, :items, column: :item_id
    add_index :stock_items, :item_id
  end
end
