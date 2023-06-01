class TimingsController < ApplicationController

        def new
       
              @timings = Timing.all
              @timing= Timing.new
              if @timing.save
                # Show saved successfully
              else
                # Show failed to save, handle the error
                puts @timing.errors.full_messages
              end
          end
          
          def create
            @timings=Timing.all
            @timing = Timing.new(timing_params)
           
            @place = Place.find(params[:timing][:place_id])
   
          
            if @timing.save
              # Handle successful save
              redirect_to @place, notice: 'timing was successfully created.'
            else
                puts @timing.errors.full_messages
              # Handle save errors
              @timings = Timing.all
              render :new
            end
          end
          def update
            @place = Place.find(params[:timing][:place_id])
           timing = Timinge.find(params[:id])
            timing.update(timing_params)
            redirect_to place
          end
       
          def edit
           
            # @place.show_id = params[:place][:show_id] 
            @timing = Timing.find(params[:id])
          end
          def destroy
            timing = Timing.find(params[:id])
            timing.destroy
            redirect_to places_path, notice: 'Time/s / Date was successfully deleted.'
          end
        
          private
        
          def timing_params
            params.require(:timing).permit(
              :user_id,
              :show_id,
              :place_id,
              :day,
              :timeslot
           )
          end
        end
    

