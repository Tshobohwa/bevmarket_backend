class RenameColumnInClients < ActiveRecord::Migration[7.1]
  def change
    rename_column :clients, :names, :name
  end
end
