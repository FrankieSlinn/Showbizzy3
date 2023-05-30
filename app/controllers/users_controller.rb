class UsersController < ApplicationController
    before_action :authenticate_user!
 

    def user_params
      params.require(:user).permit(:username, :is_performer)
    end
  
    def show
      @user = current_user
    end
    def my_shows
        @user = current_user
        @shows = @user.shows
      end
  
      def new
        @user = User.new
    
      end
      def create
        @user = User.new
      
      end
         def index
      @user = User.all
    end
end
