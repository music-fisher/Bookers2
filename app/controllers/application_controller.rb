class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

def after_sign_in_path_for(resource)
  current_user.save
  user_path(resource)
end  
protected

def configure_permitted_parameters
  devise_parameter_sanitizer.permit(:sign_up, keys: [
    :email,
    :name,
    :postcode,
    :prefecture_,
    :address_city,
    :address_street,
    # :address_building
  ])
end
end
