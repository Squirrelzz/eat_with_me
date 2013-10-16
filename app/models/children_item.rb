class ChildrenItem < ActiveRecord::Base
  belongs_to :item
  belongs_to :child, class_name: "User", foreign_key: :user_id

  has_many :items_pet, dependent: :destroy

  delegate \
    :name,
    :points,
    to: :item,
    prefix: true, 
    allow_nil: true

  default_scope { includes(:item) }
end
