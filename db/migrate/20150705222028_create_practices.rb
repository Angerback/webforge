class CreatePractices < ActiveRecord::Migration
  def change
    create_table :practices do |t|
      t.string :name
      t.text :description
      t.string :codepen
      t.text :embed

      t.timestamps null: false
    end
  end
end
