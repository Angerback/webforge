class AddNotificacionesToUser < ActiveRecord::Migration
  def change
    add_column :users, :notificaciones, :boolean, default: true
  end
end
