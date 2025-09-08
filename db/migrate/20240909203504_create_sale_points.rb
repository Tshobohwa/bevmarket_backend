class CreateSalePoints < ActiveRecord::Migration[7.1]
  def change
    create_table :sale_points do |t|
      t.string :name
      t.string :type
      t.string :address
      t.integer :establishment_id

      t.timestamps
    end
    add_foreign_key :sale_points, :establishments, column: :establishment_id
    add_index :sale_points, :establishment_id
  end
end
