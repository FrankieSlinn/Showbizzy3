class ShowsController < ApplicationController
    def index
        @shows= Show.all
    end
    def show
        @show = Show.find(params[:id])
    end
    def new
        @show = Show.new
        @show.user_id = current_user.id
    end
    
    def create
        @show = Show.new(show_params)
        if @show.save
       
            # Log success message or debug information
            Rails.logger.info "Show successfully saved to the database."
            
            redirect_to @show
          else
            # Log failure message or debug information
            Rails.logger.error "Failed to save the show to the database."
            
            render 'new'
          end
        
         


      end
      private

      def show_params
        params.require(:show).permit(:title, :description, :image, :genre, :performer, :user_id,  :current_user)
      end
end
