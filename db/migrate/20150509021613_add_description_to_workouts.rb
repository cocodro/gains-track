class AddDescriptionToWorkouts < ActiveRecord::Migration
  def change
    add_column :workouts, :description, :string, :default => ""
  end
end
