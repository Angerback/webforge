class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.string :operation
      t.integer :owner_id
      t.string :receiver_id
      t.integer :amount

      t.timestamps null: false
    end
  end
end
