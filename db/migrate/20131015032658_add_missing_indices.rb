class AddMissingIndices < ActiveRecord::Migration
  def change
    add_index :people, [:user_id]
    add_index :feeds, [:pet_id]
    add_index :feeds, [:meals_person_id]
    add_index :pets, [:character_id]
    add_index :pets, [:person_id]
    add_index :meals_people, [:meal_id]
    add_index :meals_people, [:person_id]
  end
end
