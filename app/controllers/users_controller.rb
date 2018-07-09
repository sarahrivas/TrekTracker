class UsersController < ApplicationController
  before_action :get_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    else
      render new_user_path
    end
  end

  def show

  end

  def edit

  end

  def update
    @user.update(user_params)
    if @user.save
      redirect_to @user
    else
      redirect_to edit_user_path(@user)
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path
  end

  private
  def get_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email)
  end
  
end
