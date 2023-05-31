class PlacesController < ApplicationController
    class placesController < ApplicationController
    
  
        def new
            @place = place.new
          end
    end
    def new
    
          #@place.user_id = current_user.id
       
        
  
          @places = place.all
          @place= place.new
          if @place.save
            # Show saved successfully
          else
            # Show failed to save, handle the error
            puts @place.errors.full_messages
          end
      end
      
      def create
      
        @places=place.all
        @place = place.new(place_params)
      
      
        if @place.save
          # Handle successful save
          redirect_to @show, notice: 'place was successfully created.'
        else
            puts @place.errors.full_messages
          # Handle save errors
          @places = place.all
          render :new
        end
      end
    
      private
    
      def place_params
        params.require(:place).permit(
          :user_id,
          :placevenue,
          :placetown,
          :placeaddress,
          :placeinfo)
      end
end
