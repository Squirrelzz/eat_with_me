class Character < ActiveRecord::Base
  has_many :pets, dependent: :destroy

  scope :sorted, order(:name)
end
