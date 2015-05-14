class ExercisesController < ApplicationController

  def new
    @workout = Workout.find(params[:workout_id])
    @exercise = Exercise.new
  end

  def create
    @workout = Workout.find(params[:workout_id])
    @exercise = Exercise.new(exercise_params)
    @exercise.workout = @workout

    if @exercise.save
      redirect_to @workout
    else
      flash[:error] = "Uh oh, something went wrong!  Try again!"
      redirect_to :back
    end
  end

  def edit
    @exercise = Exercise.find(params[:id])
    @workout = @exercise.workout
  end

  def update
    @workout = Workout.find(params[:workout_id])
    @exercise = Exercise.find(params[:id])
    @exercise.workout = @workout

    if @exercise.update_attributes(exercise_params)
      flash[:notice] = "Exercises updated!"
      redirect_to @exercise
    else
      flash[:error] = "Uh oh, something went wrong!  Try again!"
      redirect_to :back
    end
  end

  def destroy
    @workout = Workout.find(params[:workout_id])
    @exercise = Exercise.find(params[:id])
    @exercise.workout = @workout

    if @exercise.destroy
      redirect_to @workout
    else
      flash[:error] = "Uh oh, something went wrong!  Try again!"
      redirect_to :back
    end
  end

  private

  def exercise_params
    params.require(:exercise).permit(:name)
  end
end
