class Person < ActiveRecord::Base
  belongs_to :user
  has_many :pets, dependent: :destroy
  has_many :meals_people, dependent: :destroy
  has_many :meals, through: :meals_people
end
