class AddUserIdToExpenses < ActiveRecord::Migration[7.1]
  def change
    add_column :expenses, :user_id, :integer
    add_foreign_key :expenses, :users, column: :user_id
  end
end
