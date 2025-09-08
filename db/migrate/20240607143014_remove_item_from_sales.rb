class RemoveItemFromSales < ActiveRecord::Migration[7.1]
  def change
    remove_column :sales, :stock_item_id
    remove_column :sales, :quantity
    remove_column :sales, :unit_sale_price
  end
end
