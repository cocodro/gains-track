class CreateWeights < ActiveRecord::Migration
  def change
    create_table :weights do |t|
      t.integer :value
      t.references :user, index: true

      t.timestamps
    end
  end
end
