class AddStatusToBankAccounts < ActiveRecord::Migration
  def change
    add_column :bank_accounts, :status, :string
    remove_column :bank_accounts, :enabled, :boolean
  end
end
