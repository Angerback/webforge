class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
    	t.belongs_to :test, index:true
    	t.belongs_to :question, index:true		
      t.integer :alternative

      t.timestamps null: false
    end
  end
end
