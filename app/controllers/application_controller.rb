class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #include Pundit
  protect_from_forgery with: :exception
  #before_action :configure_permitted_parameters, if: :devise_controller?


  
  #def after_sign_in_path_for(resource)
  #  topics_path
  #end

  # before_filter :set_access_control_headers

  # def set_access_control_headers
  #   # At #1, we allow requests from any origin.
  #   headers['Access-Control-Allow-Origin'] = '*'
  #   #2, we permit the POST, GET, OPTIONS request methods.
  #   headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
  #   #3, we allow the header Content-Type, which is used in HTTP requests to declare the type of the data being sent.
  #   headers['Access-Control-Allow-Headers'] = 'Content-Type'
  # end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
  end

end
