class AddOrderToAlternatives < ActiveRecord::Migration
  def change
    add_column :alternatives, :order, :string
  end
end
