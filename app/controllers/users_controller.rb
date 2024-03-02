class UsersController < ApplicationController
  def login_form

  end

  def login_user
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      flash[:error] = "Invalid email or password"
      redirect_to login_path
    end
  end


  def show 
    if user_in_session
      user_id = user_in_session
      @user = User.find(user_in_session)
      @users = User.all
    else 
      redirect_to '/', notice: 'You must be logged in to access'
    end
  end


  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end