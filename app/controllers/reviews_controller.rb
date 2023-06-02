class ReviewsController < ApplicationController
    def index
        @reviews= Review.all
        # Code for handling the index action
      end
    
      def show
        @user = current_user
        @review=Review.find(params[:id])
        @reviews=Review.where(show_id: @user.id)
      end
    
      def new
        # @show = Show.find(params[:show_id])
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
        @show = Show.find(params[:review][:show_id])
        review = Review.find(params[:id])
        review.update(review_params)

 
        redirect_to review
      end
    
      def destroy
        @review = Review.find(params[:id])
        @review.destroy
        @reviews= Review.all
        redirect_to show_path, notice: 'Review was successfully deleted.'
      end
      def review_params
        params.require(:review).permit(
          :user_id,
          :show_id,
          :rating,
          :review,
          shows_attributes: [:id, :user_id, :title, :genre, :description, :imageup, :performer]
        )
      end
    end