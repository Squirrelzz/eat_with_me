class CreateFeed < ActiveRecord::Migration
  def change
    create_table :feeds do |t|
      t.integer :pet_id
      t.integer :meal_id

      t.timestamps
    end
  end
end
