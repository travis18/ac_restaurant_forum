class Wzht::RestaurantsController < ApplicationController
  before_action :authenticate_admin
  before_action :set_restaurant, only:[:show, :edit, :update, :destroy]
  def index
    @restaurants = Restaurant.page(params[:page]).per(10)
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      flash[:notice] = "restaurant was successfully created"
      redirect_to wzht_restaurants_path
    else
      flash.now[:alert] = "restaurant was failed to created"
      render :new
    end
  end

  def update
    if @restaurant.update(restaurant_params)
      flash.notice = "restaurant was successfully update"
      redirect_to wzht_restaurants_path(@restaurant)
    else
      flash.now.alert = "restaurant was failed to update"
      render :edit
    end
  end

  def destroy
    @restaurant.destroy
    redirect_to wzht_restaurants_path
    flash.notice = "restaurant was deleted"
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :opening_hours, :tel, :address, :description, :image, :category_id)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end
end
