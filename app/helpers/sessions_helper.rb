module SessionsHelper
  # Logs in the given user.
  def log_in(user)
    session[:user_id] = user.id
  end
  #returns the current logged in user (if any)
  def current_user
  	@current_user ||= User.find_by(id: session[:user_id])
  end

  #returns true if the user is logged in else false
  def logged_in?
  	!current_user.nil?
  end

  def log_out
    session.delete(:user_id)
  end

end
