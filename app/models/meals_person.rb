class MealsPerson < ActiveRecord::Base
  belongs_to :person
  belongs_to :meal

  has_many :feeds, dependent: :destroy

  default_scope includes(:meal)
end
