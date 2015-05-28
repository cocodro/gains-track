class WorkoutsController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @workouts = @user.workouts
  end

  def new
    @user = User.find(params[:user_id])
    @workout = Workout.new
  end

  def create
    @user = User.find(params[:user_id])
    @workout = Workout.new(workout_params)
    @workout.user = @user

    if @workout.save
      flash[:notice] = "Ready?! Go earn those gains!"
      redirect_to user_workout_path(@user, @workout)
    else
      flash[:error] = "Uh oh! Your workout wasn't saved"
      render :new
    end
  end
  
  def show
    @user = User.find(params[:user_id])
    @workout = Workout.find(params[:id])
    @workouts = @user.workouts
    @exercises = @workout.exercises
  end

  def edit
    @workout = Workout.find(params[:id])
    @exercises = @workout.exercises
  end

  def update
    @workout = Workout.find(params[:id])

    if @workout.update_attributes(workout_params)
      flash[:notice] = "Workout updated!"
      redirect_to user_workout_path(@user, @workout)
    else
      flash[:error] = "Uh oh, your changes didn't save!"
      redirect_to :back
    end
  end

  def destroy
    @workout = Workout.find(params[:id])

    if @workout.destroy
      flash[:notice] = "Workout deleted!"
      redirect_to workouts_path
    else
      flash[:error] = "Uh oh, your workout wasn't deleted!  Try again!"
      redirect_to :back
    end
  end

  private

  def workout_params
    params.require(:workout).permit(:location, :description)
  end
end
