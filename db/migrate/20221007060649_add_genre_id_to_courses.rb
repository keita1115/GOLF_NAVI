class AddGenreIdToCourses < ActiveRecord::Migration[6.1]
  def change
    add_column :courses, :genre_id, :integer
  end
end
