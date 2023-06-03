class ShowsController < ApplicationController
  skip_before_action :verify_authenticity_token

 
    def index
        @shows= Show.all
        # @show=Show.find(params[:id])
        @places=Place.all
        @reviews=Userreview.all
       
  
       
        # @reviews=@show.reviews
       
    end
    def show
      @show1 = Show.joins(:userreviews).where(userreviews: { show_id: params[:show_id] }).first
      begin
        @show = Show.find(params[:id])
        @places = @show.places
        @reviews=@show.userreviews
        # Show exists
        # Proceed with further operations
      rescue ActiveRecord::RecordNotFound
        # Show not found
        # Handle the case when the show is not found
      end
      @shows = Show.all

   
    end
    def new
      @shows = Show.all
      @show = Show.new
      @reviews = Userreview.all
      @review= Userreview.new
      
    

        @places = Place.all
        @place= Place.new
        if @show.save
          # Show saved successfully
        else
          # Show failed to save, handle the error
          puts @show.errors.full_messages
        end
    end
    
    def create

      @shows=Show.all
      @show = Show.new(show_params)
      # @place = @show.places.build
      @show.user_id = current_user.id
      if @show.save
        # Handle successful save
        redirect_to show_path(@show), notice: 'Show was successfully created.'
      else
        # Handle save errors
        @review=Userreview.all
        @places = Place.all
        render :show
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
       
    
      
      
        @reviews = Userreview.where(user_id: @user.id)

    end 
      
    def edit
      @reviews = Userreview.where(user_id: @user.id)
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
      show = Show.find(params[:id])
      
      show.update(show_params)
      userreview.update(userreview_params)
      @place = Place.where(show_id: :id)
      redirect_to show
    end
    def destroy

      @review=Userreview.find(params[:id])
      @review.destroy

      
      begin
        @show = Show.find(params[:id])
        # Show exists
        # Proceed with further operations
      rescue ActiveRecord::RecordNotFound
        # Show not found
        # Handle the case when the show is not found
      end
      if @show
      @show.destroy
      else
        puts "No show found"
      end
      redirect_to userreview_path, notice: 'Review was successfully deleted.'
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


