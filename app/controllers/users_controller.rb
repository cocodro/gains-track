class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:show]

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:notice] = "User information updated!"
      redirect_to edit_user_registration_path
    else
      flash[:error] = "Error updating user information!"
      redirect_to :back
    end
  end

  def show
    @user = User.find(params[:id])
    @weights = @user.weights
  end

  def index
    @user = User.find(params[:id])
    @weights = @user.weights
  end

  private

  def user_params
    params.require(:user).permit(:name, :picture, :picture_cache)
  end
end
