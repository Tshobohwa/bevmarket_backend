class AddIsEmployedToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :is_employed, :boolean, default: false
  end
end
