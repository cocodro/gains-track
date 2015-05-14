class CreateSets < ActiveRecord::Migration
  def change
    create_table :sets do |t|
      t.integer :order
      t.integer :reps
      t.exercise :references

      t.timestamps
    end
    add_index :sets, :references
  end
end
