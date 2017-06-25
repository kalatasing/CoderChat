class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    user.save!
    session[:user_id] = user.id
    redirect_to root_path
  end

  def show
    @user = User.all
  end

  def authenticate_user
    @user = User.find_by(email: params[:email])
      if @user.present? && @user.authenticate(params[:password])
        flash[:success] = "Sign in Successfully !! Welcome back #{@user.first_name} #{@user.last_name} "
        session[:user_id] = @user.id
        redirect_to root_path
      else
        flash.now[:error] = "Either Email or Password is incorrect"
        render 'users/sign_in'
      end
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

  def delete_user_session
    session[:user_id] = nil
    redirect_to root_path, flash: {notice: "Log out successful - GOODBYE"}
  end

  def my_friend_request

  end


end
