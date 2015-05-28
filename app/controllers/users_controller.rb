class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:show]

  def update
    if current_user.update_attributes(user_params)
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
    params.require(:user).permit(:name, :avatar, :email)
  end
end