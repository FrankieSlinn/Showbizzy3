class LocationsController < ApplicationController
    
  
    def new
        @location = Location.new
      end
end
def new

      #@location.user_id = current_user.id
    
      @show.datelocs.build.location
      @locations = Location.all
      @location= Location.new
      if @location.save
        # Show saved successfully
      else
        # Show failed to save, handle the error
        puts @location.errors.full_messages
      end
  end
  
  def create
  
    @locations=Location.all
    @location = Location.new(location_params)
    @location = Location.new
  
    if @location.save
      # Handle successful save
      redirect_to @show, notice: 'Location was successfully created.'
    else
        puts @location.errors.full_messages
      # Handle save errors
      @locations = Location.all
      render :new
    end
  end

  private

  def location_params
    params.require(:location).permit(
      :user_id,
      :venuename,
      :town,
      :address,
      :info
  end