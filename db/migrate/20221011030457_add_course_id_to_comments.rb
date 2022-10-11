class AddCourseIdToComments < ActiveRecord::Migration[6.1]
  def change
    add_column :comments, :course_id, :integer
  end
end
