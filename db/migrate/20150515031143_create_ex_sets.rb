class CreateExSets < ActiveRecord::Migration
  def change
    create_table :ex_sets do |t|
      t.integer :order
      t.integer :reps
      t.integer :weight
      t.references :exercise, index: true

      t.timestamps
    end
  end
end
