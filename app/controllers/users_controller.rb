class UsersController < ApplicationController

  # all users
  def index
    @users = User.all
  end

  # one user
  def show
    @user = User.find(params[:id])
    @user_moods = @user.moods
  end

  # form - create user
  def new
    @user = User.new
  end

  # new user
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    else
      render :new
    end
  end

  # form - edit user
  def edit
    @user = User.find(params[:id])
  end

  # edit user
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user
    else
      render :edit
    end
  end

  # delete account
  def destroy
    @user = current_user
    @user.destroy
    redirect_to("/")
  end

  private
  def user_params
    params.require(:user).permit(
      :username,
      :password,
      :password_confirmation
    )
  end

end
