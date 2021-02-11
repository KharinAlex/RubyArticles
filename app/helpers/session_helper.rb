module SessionHelper

  def log_in(user)
    session[:user_id] = user.id
  end

  def log_out
    reset_session
  end

  def current_user
    if session[:user_id]
      return User.find_by(id: session[:user_id])
    end
  end
  
end
