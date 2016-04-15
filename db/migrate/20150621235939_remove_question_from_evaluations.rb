class RemoveQuestionFromEvaluations < ActiveRecord::Migration
  def change
    remove_column :evaluations, :questions, :integer
  end
end
