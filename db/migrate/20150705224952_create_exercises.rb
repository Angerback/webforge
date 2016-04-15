class CreateExercises < ActiveRecord::Migration
  def change
    create_table :exercises do |t|
      t.belongs_to :user, index: true
      t.belongs_to :practice, index: true
      t.string :codepen
      t.text :embed

      t.timestamps null: false
    end
  end
end
