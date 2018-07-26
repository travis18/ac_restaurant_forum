class AddRestaurantFavoriteCountColumn < ActiveRecord::Migration[5.2]
  def change
    add_column :restaurants, :favorite_count, :integer
  end
end
