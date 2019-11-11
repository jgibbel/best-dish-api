class FavoritesController < ApplicationController

    #GET/favorites
    def index
        # debugger
        # user_id = params[:id]
        # @favorites = nil
        # if user_id {
        #     @favorites = Favorite.find_by(user_id: user_id)
        # } else {
        #     #debugging purposes
        #     
        # }
        @favorites = Favorite.all
        render json: @favorites, status: 200
    end

    #POST/favorites
    def create
        @favorite = Favorite.create(favorite_setparams)
        render json: @favorite, status: 200
    end


    private
  
    def favorite_setparams
      params.permit(:user_id, :restaurant_id)
    end

end
