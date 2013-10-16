class CreateItem < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.string :qualification
      t.integer :points
      t.string :image_url
    end
  end
end
