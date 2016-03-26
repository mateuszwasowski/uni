class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def authenticate_user!
    unless current_user
      flash[:notice] = "Please log in first."
      redirect_to root_path
    end
  end

  def after_sign_in_path_for(resource)
    home_path
  end
end
