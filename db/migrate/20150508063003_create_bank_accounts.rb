class CreateBankAccounts < ActiveRecord::Migration
  def change
    create_table :bank_accounts do |t|
      t.integer :balance
      t.integer :user_id
      t.boolean :enabled

      t.timestamps null: false
    end
  end
end
