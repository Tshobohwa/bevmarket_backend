class AddEstablishmentIdToClients < ActiveRecord::Migration[7.1]
  def change
    add_column :clients, :establishment_id, :integer
    add_foreign_key :clients, :establishments, column: :establishment_id
    add_index :clients, :establishment_id
  end
end
