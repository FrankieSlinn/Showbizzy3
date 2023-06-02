class ShowsController < ApplicationController
  skip_before_action :verify_authenticity_token

 
    def index
        @shows= Show.all
        @show=Show.find(params[:id])
        @places=Place.all
       
    end
    def show
      @show = Show.find(params[:id])
      @shows = Show.all

      @places = @show.places
    end
    def new
      @shows = Show.all
      @show = Show.new
      
     
     
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
        @places = Place.all
        render :new
      end
    end
    def myshows
         @user = current_user
         @shows = @user.shows
         @places = Place.where(show_id: :id)
         puts "#{@places} This is a test"
    end
      
    def edit
      # @showtitle = Show.find(params[:title])
     # redirect_to places_path(show_title: @show.title)
     @show= Show.find(params[:id])
   
     @shows = Show.where.not(id: @show.id)
     #@place = @show.place

     @places = Place.where(show_id: :id)
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
      @place = Place.where(show_id: :id)
      redirect_to show
    end
    def destroy
      show = Show.find(params[:id])
      show.destroy
      redirect_to shows_path, notice: 'Show was successfully deleted.'
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
          places_attributes: [:show_id, :placevenue, :placetown, :placeaddress, :placeinfo]
        )
      end


