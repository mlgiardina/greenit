class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def authenticate_user!
    if current_user == nil
      redirect_to login_path, alert: "You must be logged in to do that."
    end
  end

end

class Numeric
  def percent_of(n)
    self.to_f / n.to_f * 100
  end
end
