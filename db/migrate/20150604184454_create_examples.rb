class CreateExamples < ActiveRecord::Migration
  def change
    create_table :examples do |t|
      t.integer :heuristic_id
      t.text :description
      t.string :image

      t.timestamps null: false
    end
  end
end
