class AddUserIdToThemes < ActiveRecord::Migration
  def change
    add_reference :themes, :user, index: true
    add_foreign_key :themes, :users
  end
end
