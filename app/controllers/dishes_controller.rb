class DishesController < ApplicationController
    before_action :set_dish, only: [:show, :update, :destroy]

    # GET /dishs
    def index
      @dishs = Dish.all
      json_response(@dishs)
    end
  
    # POST /dishs
    def create
      @dish = Dish.create!(dish_params)
      json_response(@dish, :created)
    end
  
    # GET /dishs/:id
    def show
      json_response(@dish)
    end
  
    # PUT /dishs/:id
    def update
      @dish.update(dish_params)
      head :no_content
    end
  
    # DELETE /dishs/:id
    def destroy
      @dish.destroy
      head :no_content
    end
  
    private
  
    def dish_params
      # whitelist params
      params.permit(:name, :restaurant_id)
    end
  
    def set_dish
      @dish = Dish.find(params[:id])
    end
end
