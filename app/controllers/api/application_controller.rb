class Api::ApplicationController < ActionController::API
    #before_action :authenticate_user!
    before_action :configure_permitted_parameters, if: :devise_controller?

    protected
  
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: %i[name photo bio])
    end
  end
  