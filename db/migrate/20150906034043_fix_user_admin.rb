class FixUserAdmin < ActiveRecord::Migration
  def change
  	remove_column :users, :admin, :boolean
  	add_column :users, :admin, :boolean, default: 0
  end
end
