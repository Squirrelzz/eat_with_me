class CreateMealsPeople < ActiveRecord::Migration
  def change
    create_table :meals_people do |t|
      t.integer :meal_id
      t.integer :person_id
    end
  end
end
