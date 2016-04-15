class AddImageToEvaluations < ActiveRecord::Migration
  def change
    add_column :evaluations, :image, :string
  end
end
