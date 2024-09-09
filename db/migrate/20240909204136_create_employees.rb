class CreateEmployees < ActiveRecord::Migration[7.1]
  def change
    create_table :employees do |t|
      t.string :role
      t.integer :establishment_id
      t.integer :user_id
      t.integer :sale_point_id

      t.timestamps
    end
    add_foreign_key :employees, :establishments, column: :establishment_id
    add_foreign_key :employees, :users, column: :user_id
    add_foreign_key :employees, :sale_points, column: :sale_point_id
    add_index :employees, :establishment_id
    add_index :employees, :user_id
    add_index :employees, :sale_point_id
  end
end
