class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable,
    :validatable

  belongs_to :parent, class_name: 'User', inverse_of: :children

  has_many :children,
    class_name: 'User',
    dependent: :destroy,
    foreign_key: :parent_id,
    inverse_of: :parent

  has_many :pets

  has_many :children_items
  has_many :items, through: :children_items

  def is_parent?
    children.any?
  end

  def is_child?
    !is_parent?
  end

  def has_pet?
    pets.any?
  end

  def pet
    pets.first
  end

  def grouped_children_items
    {}.tap do |items|
      children_items.each do |children_item|
        items[children_item.item] ||= 0
        items[children_item.item] += 1
      end
    end
  end
end
