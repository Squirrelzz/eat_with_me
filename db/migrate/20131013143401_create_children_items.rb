class CreateChildrenItems < ActiveRecord::Migration
  def change
    create_table :children_items do |t|
      t.integer :item_id
      t.integer :user_id
    end

    add_index :children_items, [:item_id]
    add_index :children_items, [:user_id]
  end
end
