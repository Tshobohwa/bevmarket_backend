class CreateTrucks < ActiveRecord::Migration[7.1]
  def change
    create_table :trucks do |t|
      t.string :matricule
      t.string :marque
      t.integer :sale_point_id

      t.timestamps
    end
    add_foreign_key :trucks, :sale_points, column: :sale_point_id
    add_index :trucks, :sale_point_id
  end
end
