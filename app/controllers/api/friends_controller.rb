class Api::FriendsController < ApplicationController

  before_action :set_friend, only: [:show, :update, :destroy]

    def index
      render json: Friend.all
    end

    def show
      render json: @friend
    end

    def create
      @friend = Friend.new(friends_params)
      if(@friend.save)
        render json: @friend
      else
        render json: @friend.errors.full_messages, status: 422
      end
    end

    def update
      if(@friend.update(friends_pamas))
        render json: @friend
      else
        render json: @friend.errors.full_message, status: 422
      end
    end

    def destroy
      render json: @movie.destroy
    end

    private

    def friends_param
      params.require(:friends).permit(:name, :age, :sign, :mental_illness)
    end

    def set_friend
      @friend = Friend.find(params[:id])
    end


end
