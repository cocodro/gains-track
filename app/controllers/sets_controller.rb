class SetsController < ApplicationController

  def new
    @exercise = Exercise.find(params[:exercise_id])
    @set = ExSet.new
  end

  def create
    @exercise = Exercise.find(params[:exercise_id])
    @set = ExSet.new(set_params)
    @set.exercise = @exercise

    if @set.save
      redirect_to [@exercise.workout, @exercise]
    else
      flash[:error] = "Uh oh! We couldn't add your set!"
      redirect_to :new
    end
  end

  def update
    @exercise = Exercise.find(params[:exercise_id])
    @set = ExSet.find(params[:id])
    @set.exercise = @exercise

    if @set.update_attributes(set_params)
      redirect_to :exercise
    else
      flash[:error] = "Uh oh! We couldn't update your set!"
      redirect_to :exercise
    end
  end

  def destroy
    @exercise = Exercise.find(params[:exercise_id])
    @set = ExSet.find(params[:id])
    @set.exercise = @exercise

    if @set.destroy
      redirect_to :exercise
    else
      flash[:error] = "Uh oh! We couldn't delete your set!"
      redirect_to :exercise
    end
  end

  private

  def set_params
    params.require(:set).permit(:order, :reps, :weight)
  end
end
