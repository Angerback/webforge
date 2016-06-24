class CreateThemes < ActiveRecord::Migration
  def change
    create_table :themes do |t|
      t.string :title
      t.text :content
      t.boolean :open
      t.datetime :fecha

      t.timestamps null: false
    end
  end
end
