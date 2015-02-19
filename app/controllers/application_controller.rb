class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  #before_action :authenticate_user!
  #skip_before_filter :authenticate_user, :only => :sign_in
  layout :layout_by_resource
 
  protected
 
  def layout_by_resource
    if devise_controller? && action_name == "new"
      "login"
    else
      "application"
    end
  end

  before_filter :update_sanitized_params, if: :devise_controller?
  
  def update_sanitized_params
    if resource_name == :usuario
      @menu = 'menu1'
      devise_parameter_sanitizer.for(:sign_up) {
        |u| u.permit(:primer_nombre, :segundo_nombre, :apellido_materno, :apellido_paterno, :email, :password, :password_confirmation, :apellido_materno)
      }      
    end
    if resource_name == :empleado
      @menu = 'menu2'
      devise_parameter_sanitizer.for(:sign_up) {
        |u| u.permit(:nombres, :apellidos, :username, :empresa_id, :area_id, :role_id, :email, :password, :password_confirmation, :apellido_materno)
      }      
    end    

  end

  private
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user
  
end
