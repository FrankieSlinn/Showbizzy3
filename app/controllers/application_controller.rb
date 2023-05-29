class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    include DeviseWhitelist
    before_action :configure_permitted_parameters, if: :devise_controller?

    private

 

    protected
   


    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :is_performer ])
    end

end
