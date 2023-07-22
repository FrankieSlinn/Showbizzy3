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
        @userreviews=Userreview.all 
    end
    def show
      @show1 = Show.joins(:userreviews).where(userreviews: { show_id: params[:show_id] }).first
        @users=User.all
        @show = Show.find(params[:id])
        @userreviews=@show.userreviews
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
      @show.user_id = current_user.id
      if @show.save
        # Handle successful save
        redirect_to show_path(@show), notice: 'Show was successfully created.'
        @review=Userreview.all
      end
    end
    # Custom view where the user can see the shows they created.
    def myshows
         @user = current_user
         @shows = @user.shows
         @reviews= Userreview.where(show_id: :id)
         @places = Place.where(show_id: :id)
         puts "#{@places} This is a test"
    end
     # Custom view where the user can see the reviews they created.
    def myreviews
      @user=current_user
      # Link show to its reviews.
        @show = Show.joins(:userreviews).where(userreviews: { show_id: params[:show_id] }).first
        @shows = Show.all
        @userreviews = Userreview.where(user_id: @user.id)
    end  
    def edit
     @show= Show.find(params[:id])
     @shows = Show.where.not(id: @show.id)
    end
    def update
      @show = Show.find(params[:id])
      @user=current_user
      @show.update(show_params)
      # Redirect to path displaying the user's shows
      redirect_to user_myshows_path, notice: 'Show was successfully edited.'
    end
    def destroy
      @show = Show.find(params[:id])
      @show.destroy
      # Redirect to path displaying the user's shows
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
          :ticketlink,
          :imageup,
          :performer,
          userreviews_attributes: [:show_id, :rating, :review]
        )
      end


