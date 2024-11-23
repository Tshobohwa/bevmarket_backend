class AddEstablishmentIdToSales < ActiveRecord::Migration[7.1]
  def change
    add_column :sales, :establishment_id, :integer
    add_foreign_key :sales, :establishments, column: :establishment_id
    add_index :sales, :establishment_id
  end
end
