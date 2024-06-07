class AddClientAndUserToSales < ActiveRecord::Migration[7.1]
  def change
    add_column :sales, :user_id, :integer
    add_column :sales, :client_id, :integer
    add_foreign_key :sales, :users, column: :user_id
    add_foreign_key :sales, :clients, column: :client_id
    add_index :sales, :user_id
    add_index :sales, :client_id
  end
end
