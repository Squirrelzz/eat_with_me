class Character < ActiveRecord::Base
  has_many :pets

  default_scope order(:name)
end
