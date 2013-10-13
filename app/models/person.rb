class Person < ActiveRecord::Base
  belongs_to :user
  has_many :pets
  has_many :meals_people
  has_many :meals, through: :meals_people
end
