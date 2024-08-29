class AddIsPartnerColumnToClients < ActiveRecord::Migration[7.1]
  def change
    add_column :clients, :is_partner, :boolean, default: false, null: false
  end
end
