class AddScoreToCourses < ActiveRecord::Migration[6.1]
  def change
    add_column :courses, :score, :string
  end
end
