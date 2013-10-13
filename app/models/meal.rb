class Meal < ActiveRecord::Base
  has_many :feeds
  default_scope order(:qualification, :name)
end
