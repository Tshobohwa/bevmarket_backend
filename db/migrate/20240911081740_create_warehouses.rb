class CreateWarehouses < ActiveRecord::Migration[7.1]
  def change
    create_table :warehouses do |t|
      t.string :name
      t.string :location
      t.integer :sale_point_id

      t.timestamps
    end
    add_foreign_key :warehouses, :sale_points, column: :sale_point_id
    add_index :warehouses, :sale_point_id
  end
end
