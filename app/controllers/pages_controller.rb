class PagesController < ApplicationController
   
  def loggedin
  end
    def home
        @shows = Show.all # Assuming you have a Show model representing your shows
      end
      def splash

        @shows = Show.all # Assuming you have a Show model representing your shows
      end

end
