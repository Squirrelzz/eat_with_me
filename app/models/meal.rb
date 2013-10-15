class Meal < ActiveRecord::Base
  has_many :feeds, dependent: :destroy
  has_many :meals_people, dependent: :destroy
  has_many :people, through: :meals_people
end
