class VotesController < ApplicationController
    before_action :set_vote, only: [:show, :update, :destroy]

    # GET /votes
    def index
      @votes = Vote.all
      json_response(@votes)
    end
  
    # POST /votes
    def create
      @vote = Vote.create!(vote_params)
      json_response(@vote, :created)
    end
  
    # GET /votes/:id
    def show
      json_response(@vote)
    end
  
    # PUT /votes/:id
    def update
      @vote.update(vote_params)
      head :no_content
    end
  
    # DELETE /votes/:id
    def destroy
      @vote.destroy
      head :no_content
    end
  
    private
  
    def vote_params
      # whitelist params
      params.permit(:name, :restaurant_id)
    end
  
    def set_vote
      @vote = Vote.find(params[:id])
    end
end
