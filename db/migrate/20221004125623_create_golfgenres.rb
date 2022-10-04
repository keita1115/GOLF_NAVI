class CreateGolfgenres < ActiveRecord::Migration[6.1]
  def change
    create_table :golfgenres do |t|
      t.integer :genre_id
      t.integer :golf_id

      t.timestamps
    end
  end
end
