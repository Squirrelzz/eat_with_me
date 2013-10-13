class CreateCharacter < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.string :name, null: false
      t.string :image_url
    end
  end
end
