class RemoveTimestamps < ActiveRecord::Migration[7.1]
  def change
    # remove timestamp from users table
    remove_column :users, :created_at, :datetime
    remove_column :users, :updated_at, :datetime

    # remove timestamp from clients table
    remove_column :clients, :created_at, :datetime
    remove_column :clients, :updated_at, :datetime


    # remove timestamp from items table
    remove_column :items, :created_at, :datetime
    remove_column :items, :updated_at, :datetime

    # remove timestamp from sale_items table
    remove_column :sale_items, :created_at, :datetime
    remove_column :sale_items, :updated_at, :datetime

    # remove updated at from sales table
    remove_column :sales, :updated_at, :datetime

    # remove updated_at from expenses table
    remove_column :expenses, :updated_at, :datetime
  end
end
