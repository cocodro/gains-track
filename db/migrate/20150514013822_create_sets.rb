class CreateSets < ActiveRecord::Migration
  def change
    create_table :sets do |t|
      t.integer :order
      t.integer :reps
      t.integer :weight
      t.references :exercise, index: true

      t.timestamps
    end
  end
end
