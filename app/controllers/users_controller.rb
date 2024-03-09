class UsersController < ApplicationController
  def login_form

  end

  def new 

  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user.id)
      flash[:success] = "Welcome, #{@user.email}!"
    else  
      redirect_to register_path
      flash[:error] = "Please Fill In Required Fields"
    end 
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

  def logout 
    session.destroy 
    redirect_to root_path
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
    params.permit(:name, :email, :password, :password_confirmation)
  end
end