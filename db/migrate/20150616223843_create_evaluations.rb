class CreateEvaluations < ActiveRecord::Migration
  def change
    create_table :evaluations do |t|
      t.string :name
      t.text :description
      t.integer :questions

      t.timestamps null: false
    end
  end
end
