class CreateCourses < ActiveRecord::Migration[6.1]
  def change
    create_table :courses do |t|
      t.integer :user_id
      t.string :title
      t.string :image
      t.text :body


      t.timestamps
    end
  end
end