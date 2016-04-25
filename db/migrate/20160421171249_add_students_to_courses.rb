class AddStudentsToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :students, :integer
  end
end
