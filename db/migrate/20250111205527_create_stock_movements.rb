class CreateStockMovements < ActiveRecord::Migration[7.1]
  def change
    create_table :stock_movements do |t|
      t.integer :stock_item_id
      t.decimal :quantity
      t.string :type

      t.timestamps
    end
    add_foreign_key :stock_movements, :stock_items, column: :stock_item_id
    add_index :stock_movements, :stock_item_id
  end
end
