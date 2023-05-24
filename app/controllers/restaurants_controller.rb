class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: %i[show edit update destroy]

  def index
    @restaurants = Restaurant.all
  end

  def show
    puts "test test test"
    @review = Review.new
    puts "test test test"
  end

  def new
    @restaurant = Restaurant.new # Needed to instantiate the form_with
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.save # Will raise ActiveModel::ForbiddenAttributesError
    redirect_to restaurant_path(@restaurant)
  end

  def edit; end

  def update
    @restaurant.update(restaurant_params)
    # No need for app/views/restaurants/update.html.erb
    redirect_to restaurant_path(@restaurant)
  end

  def destroy
    @restaurant.destroy
    # No need for app/views/restaurants/destroy.html.erb
    redirect_to restaurants_path, status: :see_other
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end
end
