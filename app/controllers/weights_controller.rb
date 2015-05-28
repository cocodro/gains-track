class WeightsController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @weights = @user.weights
  end

  def new
    @user = User.find(params[:user_id])
    @weight = Weight.new
  end

  def create
    @user = User.find(params[:user_id])
    @weight = Weight.new(weight_params)
    @weight.user = @user

    if @weight.save
      flash[:notice] = "Weight recorded!  Keep tracking and check out your progress on the weight history tab."
      redirect_to user_weights_path(@user, @weights)
    else
      flash[:error] = "Weight not recorded!  Try again."
      redirect_to new_user_weight_path
    end
  end

  def show
    @user = User.find(params[:user_id])
    @weight = Weight.find(params[:id])
    @weights = @user.weights
  end

  def edit
    @user = User.find(params[:user_id])
    @weight = Weight.find(params[:id])
    @weights = @user.weights
  end

  def update
    @user = User.find(params[:id])
    @weight = Weight.find(params[:id])
    @weights = @user.weights

    if @weight.update_attributes(weight_params)
      flash[:notice] = "Weight updated!"
      redirect_to user_weight_path
    else
      flash[:error] = "Weight not update!  Try again."
      redirect_to edit_user_weight_path
    end
  end

  private

  def weight_params
    params.require(:weight).permit(:value)
  end
end
