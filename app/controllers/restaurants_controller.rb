class RestaurantsController < ApplicationController
  before_action :authenticate_user!
  def index
    @restaurants = Restaurant.page(params[:page]).per(9)
    @categories = Category.all
    @nav = "index"
  end

  def show
    @restaurant = get_restaurant
    @comment = Comment.new
  end

  def feeds
    @recent_restaurants = Restaurant.order(created_at: :desc).limit(10)
    @recent_comments = Comment.order(created_at: :desc).limit(10)
    @nav = "feeds"
  end

  def favorite
    @restaurant = get_restaurant
    @restaurant.favorites.create!(user:current_user)
    redirect_back(fallback_location: root_path)
  end

  def unfavorite
    @restaurant = get_restaurant
    favorites = Favorite.where(restaurant: @restaurant, user: current_user)
    favorites.destroy_all
    redirect_back(fallback_location: root_path)
  end

  def like
    @restaurant = get_restaurant
    @restaurant.likes.create!(user:current_user)
    redirect_back(fallback_location: root_path)
  end

  def unlike
    @restaurant = get_restaurant
    likes = Like.where(restaurant: @restaurant, user: current_user)
    likes.destroy_all
    redirect_back(fallback_location: root_path)
  end

  private

  def get_restaurant
    Restaurant.find(params[:id])
  end
end
