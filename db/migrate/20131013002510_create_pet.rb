class CreatePet < ActiveRecord::Migration
  def change
    create_table :pets do |t|
      t.string :name, null: false
      t.string :sex, null: false
      t.integer :character_id, null: false
      t.integer :person_id, null: false
    end
  end
end
