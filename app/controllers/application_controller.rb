class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def authorize
    redirect_to companies_path, notice: "Please Log In" if current_user.nil?
  end

  def flash_class(value)
    case value
    when 'notice' then "alert alert-info"
    when 'success' then "alert alert-success"
    when 'error' then "alert alert-error"
    when 'alert' then "alert alert-error"
    end
  end
  helper_method  :flash_class
end
