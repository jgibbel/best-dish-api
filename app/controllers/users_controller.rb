class UsersController < ApplicationController

  def index
    users = User.all
    render json: users
  end

    def show
      # byebug
        # user_id = params[:id]
        # if user_id_from_token == user_id.to_i
        #   user = User.find(user_id)
        #   render json: user
        # else
        #   render json: { go_away: true }, status: :unauthorized
        # end
        user_id = params[:id]
        user = User.find(user_id)
        if user 
          render json: user
        else 
          render json: { error: "bad"}
        end
        
      end

      def create
        user = User.create(user_params)
        if user.valid?
          render json: { ok: true }
        else
          render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
        end
      end

      private

      def user_params
        params.permit(:name, :password)
      end



end
