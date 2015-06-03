class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :name
      t.text :description
      t.string :public, :default => "public"
      t.references :user, index: true

      t.timestamps
    end
  end
end
