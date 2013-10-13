class MealsPerson < ActiveRecord::Base
  belongs_to :person
  belongs_to :meal

  has_many :feeds
end
