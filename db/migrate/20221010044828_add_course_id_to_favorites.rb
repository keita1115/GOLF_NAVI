class AddCourseIdToFavorites < ActiveRecord::Migration[6.1]
  def change
    add_column :favorites, :course_id, :integer
  end
end
