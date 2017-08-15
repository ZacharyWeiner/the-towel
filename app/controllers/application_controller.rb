class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  layout 'application'
  @@SITE_ADMIN = 'site_admin'
  @@CITY_ADMIN = 'city_admin'
  @@COHORT_ADMIN = 'cohort_admin'
  @@COHORT_MEMBER = 'cohort_member'


  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :display_name, :profile_image,  :password, :tag_list])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :email, :display_name, :profile_image,  :password,  :current_password, :tag_list])
  end
end
