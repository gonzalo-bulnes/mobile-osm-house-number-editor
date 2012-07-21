class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user, :user_signed_in?, :sign_in_required

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def user_signed_in?
    if session[:user_id]
      return true
    else
      return false
    end
  end

  def sign_in_required
    if user_signed_in?
      return true
    else
      redirect_to signin_path
    end
  end
end
