class CreateCompositions < ActiveRecord::Migration
  def change
    create_table :compositions do |t|
      t.belongs_to :evaluation, index: true
      t.belongs_to :question, index: true
      t.integer :number

      t.timestamps null: false
    end
  end
end
