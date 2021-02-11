class UsersController < ApplicationController
  before_action :require_login, :get_instance, except: [:new, :create]

  def show
  end

  def new
  	@user = User.new
  end

  def edit
  end

  def destroy
    current_user.destroy
    log_out
    redirect_to home_index_path
  end

  def update
    if current_user.update(user_params)
      redirect_to profile_path
      flash[:success] = "Edit successfull"
    else
      render 'edit'
      flash[:danger] = "Edit failed"
    end
  end

  def create
  	@user = User.new(user_params)

  	if @user.save
      log_in(@user)
      redirect_to profile_path
  	  flash[:success] = "User created successfully. Please, edit your profile"
    else
      redirect_to new_user_path
      flash[:danger] = "Form is invalid"
  	end
  end

  def edit_password 
  end

  def update_password
    if @user.password == params[:old_password] && @user.update(params.permit(:password))
      redirect_to profile_path
      flash[:success] = "Edit successfull"
    else
      render 'edit_password'
      flash[:danger] = "Incorrect password"
    end
  end
  
private

  def require_login
    if !current_user
      redirect_to login_path
    end
  end

  def get_instance
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :first_name, :last_name, :country, :about, :birthday, :is_staff)
  end

end
