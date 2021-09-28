class RestaurantsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :restaurant_not_found
    #GET /restaurants
    def index
        restaurants = Restaurant.all
        render json: restaurants
    end

    # GET /restaurants/:id
    def show
        restaurant = Restaurant.find(params[:id])
        render json: restaurant, include: :pizzas
    end

    #DELETE /restaurants/:id
    def destroy
        Restaurant.find(params[:id]).destroy
        head :no_content
    end

    private
    def restaurant_not_found
        render json: { error: "Restaurant not found" }, status: :not_found
    end

end
