class RestaurantPizzasController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity
   
    #Post /restaurant_pizzas
    def create
        restaurant_pizza = RestaurantPizza.create!(params.permit(:price, :pizza_id, :restaurant_id))
            render json: restaurant_pizza.pizza, status: :created
    end


private 


    def render_unprocessable_entity(exception)
        render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity 
    end

end
