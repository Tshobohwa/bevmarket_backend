class RenameIsPartnerToIsPartenerInClients < ActiveRecord::Migration[7.1]
  def change
    rename_column :clients, :is_partner, :is_partener
  end
end
