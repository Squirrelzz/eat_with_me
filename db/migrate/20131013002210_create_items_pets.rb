class CreateItemsPets < ActiveRecord::Migration
  def change
    create_table :items_pets do |t|
      t.integer :pet_id
      t.integer :children_item_id

      t.timestamps
    end

    add_index :items_pets, [:pet_id]
    add_index :items_pets, [:children_item_id]
  end
end
