class AddCreatedByToEstablishments < ActiveRecord::Migration[7.1]
  def change
    add_column :establishments, :created_by, :integer
    add_foreign_key :establishments, :users ,column: :created_by
    add_index :establishments, :created_by
  end
end
