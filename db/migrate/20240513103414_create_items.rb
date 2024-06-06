class CreateItems < ActiveRecord::Migration[7.1]
  def change
    create_table :items do |t|
      t.string :name
      t.integer :bottles_number
      t.integer :capacity
      t.string :capacity_unit

      t.timestamps
    end
  end
end
