class RemoveGolfIdFromComments < ActiveRecord::Migration[6.1]
  def change
    remove_column :comments, :golf_id, :integer
  end
end
