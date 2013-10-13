class CreateMeal < ActiveRecord::Migration
  def change
    create_table :meals do |t|
      t.string :name
      t.string :qualification
      t.string :points
      t.string :image_url
    end
  end
end
