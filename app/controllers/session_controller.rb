class SessionController < ApplicationController
  
  def new
  end

  def create
  	user = User.find_by(email: params[:session][:email].downcase)
    if user && user.password == params[:session][:password]
      log_in user
      flash[:success] = "Login successful"
      redirect_to home_index_path
    else
      flash[:danger] = "Wrong email/password!"
      render 'new'
    end
  end

  def destroy
  	log_out
  	redirect_to home_index_path
  end
end
