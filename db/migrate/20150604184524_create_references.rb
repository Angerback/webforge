class CreateReferences < ActiveRecord::Migration
  def change
    create_table :references do |t|
      t.integer :heuristic_id
      t.text :description
      t.string :link

      t.timestamps null: false
    end
  end
end
