class CreateAlternatives < ActiveRecord::Migration
  def change
    create_table :alternatives do |t|
      t.belongs_to :question, index:true
      t.text :sentence

      t.timestamps null: false
    end
  end
end
