class RemoveGolfIdFromFavorites < ActiveRecord::Migration[6.1]
  def change
    remove_column :favorites, :golf_id, :integer
  end
end
