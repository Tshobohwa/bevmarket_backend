class CreateSalePointStockItems < ActiveRecord::Migration[7.1]
  def change
    create_table :sale_point_stock_items do |t|
      t.integer :stock_item_id
      t.integer :sale_point_id
      t.integer :quantity

      t.timestamps
    end
    add_foreign_key :sale_point_stock_items, :stock_items, column: :stock_item_id
    add_foreign_key :sale_point_stock_items, :sale_points, column: :sale_point_id
    add_index :sale_point_stock_items, :stock_item_id
    add_index :sale_point_stock_items, :sale_point_id
  end
end
