class RenameColumnTypeToMovementTypeInStockMovements < ActiveRecord::Migration[7.1]
  def change
    rename_column :stock_movements, :type, :movement_type
  end
end
