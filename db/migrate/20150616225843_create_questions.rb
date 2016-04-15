class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.belongs_to :topic, index:true	
      t.text :sentence
      t.integer :answer
      t.string :type

      t.timestamps null: false
    end
  end
end
