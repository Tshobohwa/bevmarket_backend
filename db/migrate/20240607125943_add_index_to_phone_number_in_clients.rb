class AddIndexToPhoneNumberInClients < ActiveRecord::Migration[7.1]
  def change
    add_index :clients, :phone_number, unique: true
  end
end
