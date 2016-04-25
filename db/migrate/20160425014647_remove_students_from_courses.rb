class RemoveStudentsFromCourses < ActiveRecord::Migration
  def change
    remove_column :courses, :students, :integer
  end
end
