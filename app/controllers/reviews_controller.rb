class ReviewsController < ApplicationController
    def index
        @reviews= Review.all
        # Code for handling the index action
      end
    
      def show
        @review=Review.find(params[:id])
      end
    
      def new
        @reviews = Review.all
        @review= Review.new
        if @review.save
          # Show saved successfully
        else
          # Show failed to save, handle the error
          puts @review.errors.full_messages
        end
        # Code for handling the new action
      end
    
      def create
        @reviews=Review.all
        @review = Review.new(review_params)
       
        @show = Show.find(params[:show_id])
        # @show.places.create(place_params)
      
        if @review.save
          # Handle successful save
          redirect_to @review, notice: 'Review was successfully created.'
        else
            puts @review.errors.full_messages
          # Handle save errors
       
          render :new
        end
      end
    
      def edit
        # Code for handling the edit action
      end
    
      def update
        # Code for handling the update action
      end
    
      def destroy
        # Code for handling the destroy action
      end
      def review_params
        params.require(:review).permit(
          :user_id,
          :show_id,
          :rating,
          :review,
        )
      end
    end