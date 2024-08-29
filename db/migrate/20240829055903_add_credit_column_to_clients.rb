class AddCreditColumnToClients < ActiveRecord::Migration[7.1]
  def change
    add_column :clients, :credit, :float, default: 0.0, null: false
  end
end
