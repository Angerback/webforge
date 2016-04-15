class CreateDonts < ActiveRecord::Migration
  def change
    create_table :donts do |t|
      t.text :description
      t.integer :heuristic_id

      t.timestamps null: false
    end
  end
end
