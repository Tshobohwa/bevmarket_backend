class AddMatriculeAndMarqueToSalePoints < ActiveRecord::Migration[7.1]
  def change
    add_column :sale_points, :matricule, :string
    add_column :sale_points, :marque, :string
  end
end
