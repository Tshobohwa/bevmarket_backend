class CreateEstablishment < ActiveRecord::Migration[7.1]
  def change
    create_table :establishments do |t|
      t.string :name

      t.timestamps
    end
  end
end
