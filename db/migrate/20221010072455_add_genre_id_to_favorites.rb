class AddGenreIdToFavorites < ActiveRecord::Migration[6.1]
  def change
    add_column :favorites, :genre_id, :integer
  end
end
