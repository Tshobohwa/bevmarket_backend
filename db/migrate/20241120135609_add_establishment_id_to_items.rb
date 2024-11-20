class AddEstablishmentIdToItems < ActiveRecord::Migration[7.1]
  def change
    add_column :items, :establishment_id, :integer
    add_foreign_key :items, :establishments, column: :establishment_id
    add_index :items, :establishment_id
  end
end
