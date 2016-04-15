class CreateDos < ActiveRecord::Migration
  def change
    create_table :dos do |t|
      t.text :description
      t.integer :heuristic_id

      t.timestamps null: false
    end
  end
end
