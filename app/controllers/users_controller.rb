class UsersController < ApplicationController
    before_action :authenticate_user!
 

    def user_params
      params.require(:user).permit(:username, :is_performer)
    end
    def show
      @user = current_user
    end
      def new
        @user = User.new
      end
      def myreviews
        @user = current_user
        @shows = Show.all
        @reviews = Userreview.where(show_id: @user.id)
      end
      def create
        @user = User.new
      end
         def index
      @user = User.all
    end
    def myshows
      @user = current_user
      @shows = @user.shows
 end
end
