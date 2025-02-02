class AddUnitPriceToStockMovements < ActiveRecord::Migration[7.1]
  def change
    add_column :stock_movements, :unit_price, :float
  end
end
