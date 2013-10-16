class Item < ActiveRecord::Base
  has_many :children_items, dependent: :destroy
  has_many :children, through: :children_items

  default_scope { order(:qualification, :name) }
end
