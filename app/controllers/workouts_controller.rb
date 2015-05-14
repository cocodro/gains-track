class WorkoutsController < ApplicationController

  def index
    @workouts = Workout.all
  end

  def show
    @workout = Workout.find(params[:id])
    @exercises = @workout.exercises
  end

  def new
    @workout = Workout.new
  end

  def create
    @workout = Workout.new(workout_params)

    if @workout.save
      redirect_to @workout
    else
      flash[:error] = "Uh oh! Your workout wasn't saved"
      render :new
    end
  end

  def edit
    @workout = Workout.find(params[:id])
    @exercises = @workout.exercises
  end

  def update
    @workout = Workout.find(params[:id])

    if @workout.update_attributes(workout_params)
      flash[:notice] = "Workout updated!"
      redirect_to @workout
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
