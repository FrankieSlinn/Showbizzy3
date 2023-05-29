class PagesController < ApplicationController
 
    def home
        @shows = Show.all # Assuming you have a Show model representing your shows
      end
  
    def loggedin
    end
end
