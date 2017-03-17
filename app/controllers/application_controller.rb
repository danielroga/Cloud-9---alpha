class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # methods in here available to all controllers
  
  protect_from_forgery with: :exception
  
  helper_method :current_user, :logged_in
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]  #optimization !!=
  end
  
  def logged_in
    !!current_user #use !! to convert to bolean
  end
  
  def require_user
    if !logged_in
      flash[:danger] = "You must logged in first"
      redirect_to root_path
    end
  end
end
