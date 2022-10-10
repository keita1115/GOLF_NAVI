class AddAddressToCourses < ActiveRecord::Migration[6.1]
  def change
    add_column :courses, :address, :string
  end
end
