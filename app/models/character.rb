class Character < ActiveRecord::Base
  has_many :pets, dependent: :destroy

  default_scope order(:name)
end
