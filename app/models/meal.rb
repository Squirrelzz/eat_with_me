class Meal < ActiveRecord::Base
  has_many :feeds, dependent: :destroy
  has_many :meals_people, dependent: :destroy
  has_many :people, through: :meals_people
  default_scope order(:qualification, :name)
end
