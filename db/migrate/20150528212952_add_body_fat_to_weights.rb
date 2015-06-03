class AddBodyFatToWeights < ActiveRecord::Migration
  def change
    add_column :weights, :bodyfat, :decimal
  end
end
