class ShowsController < ApplicationController
  skip_before_action :verify_authenticity_token

 
    def index
      if params[:category].present?
        # Perform filtering based on the selected category
        @shows = Show.where(category: params[:category])
      else
        # Load all shows when no category is selected
        @shows = Show.all
      end
      
        # @show=Show.find(params[:id])
      
        @userreviews=Userreview.all
      
  
       
        # @reviews=@show.reviews
       
    end
    def show
      
      @show1 = Show.joins(:userreviews).where(userreviews: { show_id: params[:show_id] }).first
    
        @users=User.all

        @show = Show.find(params[:id])
        @userreviews=@show.userreviews
        # @user = User.joins(shows: :userreviews).where(userreviews: { id: current_user.id }).first

     
   
      @shows = Show.all

   
    end
    def new
      @shows = Show.all
      @show = Show.new
      @userreviews = Userreview.all
      @userreview= Userreview.new
  

    end
    
    def create

      @shows=Show.all
      @show = Show.new(show_params)
      # @place = @show.places.build
      @show.user_id = current_user.id
      if @show.save
        # Handle successful save
        redirect_to show_path(@show), notice: 'Show was successfully created.'
      # else
      #   flash.now[:alert] = 'Error saving information. Please make sure you have completed the mandatory fields.'

        @review=Userreview.all

    
      end
    end
    def myshows
     
         @user = current_user
        #  @show= Show.find(params[@user.id])
         @shows = @user.shows
         @reviews= Userreview.where(show_id: :id)
        
         @places = Place.where(show_id: :id)
         puts "#{@places} This is a test"
    end
    def myreviews
      @user=current_user
     # @show = Show.includes(:reviews).find(params[:show_id])
     @show = Show.joins(:userreviews).where(userreviews: { show_id: params[:show_id] }).first
      

        @shows = Show.all
        
       
    
      
      
        @userreviews = Userreview.where(user_id: @user.id)

    end 
      
    def edit
     # @reviews = Userreview.where(user_id: @user.id)
      # @showtitle = Show.find(params[:title])
     # redirect_to places_path(show_title: @show.title)
     @show= Show.find(params[:id])
   
     @shows = Show.where.not(id: @show.id)
     #@place = @show.place
     @place = Place.where(show_id: params[:id], id: params[:place_id])
     @places = Place.where(show_id: :id)
     @timings = Timing.where(place_id: :id)
    # @place = Place.where(show_id: :id id: :place_id)
     #@timings = @show.place.timing
    # @place = Place(params[show_id: :id])
    end
    # def update
    # @show = Show.find(params[:id])
    #  @show.update(show_params)
    #  redirect_to @show
    # end
    def update
      @show = Show.find(params[:id])
      @user=current_user
      #@userreview=Userreview.find(params[:id])
     # @userreview.update(userreview_params)
      @show.update(show_params)
      #userreview.update(userreview_params)
    

    end
    def destroy
        @show = Show.find(params[:id])

      @show.destroy

      redirect_to user_myshows_path, notice: 'Show was successfully deleted.'
    end

 
      
      end
      private

      def show_params
        params.require(:show).permit(
          :user_id,
          :title,
          :genre,
          :description,
          :imageup,
          :performer,
          userreviews_attributes: [:show_id, :rating, :review], places_attributes: [:show_id, :placevenue, :placetown, :placeaddress, :placeinfo, timings_attributes: [:place_id, :day, :timeshot]]
        )
      end


