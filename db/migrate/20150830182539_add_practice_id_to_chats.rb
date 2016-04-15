class AddPracticeIdToChats < ActiveRecord::Migration
  def change
    add_column :chats, :practice_id, :integer
  end
end
