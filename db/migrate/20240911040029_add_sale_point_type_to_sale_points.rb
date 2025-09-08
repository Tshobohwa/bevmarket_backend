class AddSalePointTypeToSalePoints < ActiveRecord::Migration[7.1]
  def change
    add_column :sale_points, :sale_point_type, :string
  end
end
