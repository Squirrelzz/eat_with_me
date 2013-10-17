class ChildrenItem < ActiveRecord::Base
  belongs_to :item
  belongs_to :child, class_name: "User", foreign_key: :user_id

  has_many :items_pet, dependent: :destroy

  attr_accessor :count

  delegate \
    :points,
    to: :item,
    prefix: true,
    allow_nil: true

  default_scope { includes(:item).order("items.qualification, items.name") }

  def item_name
    return "" unless item.present?
    item.try(:name).titleize
  end
end
