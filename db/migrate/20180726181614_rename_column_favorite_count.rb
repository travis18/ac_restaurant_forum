class RenameColumnFavoriteCount < ActiveRecord::Migration[5.2]
  def change
    rename_column :restaurants, :favorite_count, :favorites_count
  end
end
