class AddSalePointIdToSales < ActiveRecord::Migration[7.1]
  def change
    add_column :sales, :sale_point_id, :integer
    add_foreign_key :sales, :sale_points ,column: :sale_point_id
    add_index :sales, :sale_point_id
  end
end
