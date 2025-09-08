class AddCurrentEstablishmentIdToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :current_establishment_id, :integer
  end
end
