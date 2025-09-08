class AddEstablishmentIdAndSalePointIdToExpenses < ActiveRecord::Migration[7.1]
  def change
    add_column :expenses, :establishment_id, :integer
    add_column :expenses, :sale_point_id, :integer
    add_foreign_key :expenses, :establishments, column: :establishment_id
    add_index :expenses, :establishment_id
    add_foreign_key :expenses, :sale_points, column: :sale_point_id
    add_index :expenses, :sale_point_id
  end
end
