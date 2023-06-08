class UserreviewsController < ApplicationController
    def index
        @reviews= Userreview.all
      end
      def show
        @user = current_user
        @show = Show.joins(:userreviews).where(userreviews: { show_id: params[:show_id] }).first
        if Userreview.exists?(params[:id])
            @review = Userreview.find(params[:id])
          else
          # Handle the case when the record doesn't exist
            puts "error id isn't there"
          end
        @reviews=Userreview.where(show_id: @user.id)
      end
      def new
        # @show = Show.find(params[:show_id])
        @reviews = Userreview.all
        @review= Userreview.new
      
        if @review.save
          # Show saved successfully
        else
          # Show failed to save, handle the error
          puts @review.errors.full_messages
        end
        # Code for handling the new action
      end
      def create
        @reviews=Userreview.all
        @review = Userreview.new(review_params)
        if @review.save
          # Handle successful save
          redirect_to @review, notice: 'Review was successfully created.'
        else
           # Handle save errors
          puts @review.errors.full_messages
        end
      end
      def edit
        @userreview=User.find(params[:id])
        @show = Show.joins(:userreviews).where(userreviews: { show_id: params[:show_id] }).first
      end
      def update
        @showid= :show_id
        #@shows = Show.find(params[:review][:show_id])
        @userreview = Userreview.find(params[:id])
        @userreview.update(review_params)
        redirect_to shows_myreviews_path, notice: 'Review was successfully edited.'
      end
      def destroy
        @review = Userreview.find(params[:id])
        @review.destroy
        redirect_to shows_myreviews_path, notice: 'Review was successfully deleted.'
      end
      def review_params
        params.require(:userreview).permit(
          :user_id,
          :show_id,
          :rating,
          :review,
          shows_attributes: [:id, :user_id, :title, :genre, :description, :imageup, :performer]
        )
      end
end
