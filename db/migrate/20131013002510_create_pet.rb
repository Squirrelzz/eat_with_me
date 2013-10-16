class CreatePet < ActiveRecord::Migration
  def change
    create_table :pets do |t|
      t.string :name, null: false
      t.string :sex, null: false
      t.integer :character_id, null: false
      t.integer :user_id, null: false
    end

    add_index :pets, [:character_id]
    add_index :pets, [:user_id]
  end
end
