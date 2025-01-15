class AddEtablishmentIdToStockMovements < ActiveRecord::Migration[7.1]
  def change
    add_column :stock_movements, :establishment_id, :integer
    add_foreign_key :stock_movements, :establishments, column: :establishment_id
    add_index :stock_movements, :establishment_id
  end
end
