class CreateTests < ActiveRecord::Migration
  def change
    create_table :tests do |t|
      t.belongs_to :user, index:true
      t.belongs_to :evaluation, index:true
      t.decimal :grade

      t.timestamps null: false
    end
  end
end
