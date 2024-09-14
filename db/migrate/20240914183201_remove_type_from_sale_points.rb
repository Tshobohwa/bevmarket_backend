class RemoveTypeFromSalePoints < ActiveRecord::Migration[7.1]
  def change
    remove_column :sale_points, :type, :string
  end
end
