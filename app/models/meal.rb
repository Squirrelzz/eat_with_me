class Meal < ActiveRecord::Base
  has_many :feeds
  has_many :meals_people
  has_many :people, through: :meals_people
  default_scope order(:qualification, :name)
end
