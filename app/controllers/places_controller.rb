class PlacesController < ApplicationController
    def index
        @places= Place.all
        @timings=Timing.all
       
    end
    def new
          @places = Place.all
          @place= Place.new
          if @place.save
            # Show saved successfully
          else
            # Show failed to save, handle the error
            puts @place.errors.full_messages
          end
      end
      
      def create
        @places=Place.all
        @place = Place.new(place_params)
       
        @show = Show.find(params[:place][:show_id])
        # @show.places.create(place_params)
      
        if @place.save
          # Handle successful save
          redirect_to @place, notice: 'place was successfully created.'
        else
            puts @place.errors.full_messages
          # Handle save errors
          @places = Place.all
          render :new
        end
      end

      def show
        @place = Place.find(params[:id])
        @places = Place.all
  
        @timings = @place.timings
      end
    
      private
    
      def place_params
        params.require(:place).permit(
          :user_id,
          :show_id,
          :placevenue,
          :placetown,
          :placeaddress,
          :placeinfo)
      end
    end


