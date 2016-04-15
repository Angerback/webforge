class RenameCodepenForPlunk < ActiveRecord::Migration
  def change
  	rename_column :practices, :codepen, :plunk
  	rename_column :exercises, :codepen, :plunk
  end
end
