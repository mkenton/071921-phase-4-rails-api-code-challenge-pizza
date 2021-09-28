class RestaurantsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :restaurant_not_found
    #GET /restaurants
    def index
        restaurants = Restaurant.all
        render json: restaurants, except: [:created_at, :updated_at] 
    end

    # GET /restaurants/:id
    def show
        restaurant = Restaurant.find(params[:id])
        render json: restaurant, serializer: RestaurantPizzaSerializer
        #except: [:created_at, :updated_at], include: :pizzas, except: [:created_at, :updated_at] 
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
