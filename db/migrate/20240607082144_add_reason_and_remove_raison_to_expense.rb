class AddReasonAndRemoveRaisonToExpense < ActiveRecord::Migration[7.1]
  def change
    remove_column :expenses, :raison
    add_column :expenses, :reason, :text
  end
end
