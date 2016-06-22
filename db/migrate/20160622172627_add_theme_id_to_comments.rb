class AddThemeIdToComments < ActiveRecord::Migration
  def change
    add_reference :comments, :theme, index: true
    add_foreign_key :comments, :themes
  end
end
