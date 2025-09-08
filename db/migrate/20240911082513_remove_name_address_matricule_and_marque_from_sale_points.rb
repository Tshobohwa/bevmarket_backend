class RemoveNameAddressMatriculeAndMarqueFromSalePoints < ActiveRecord::Migration[7.1]
  def change
    remove_column :sale_points, :name, :string
    remove_column :sale_points, :address, :string
    remove_column :sale_points, :matricule, :string
    remove_column :sale_points, :marque, :string
  end
end
