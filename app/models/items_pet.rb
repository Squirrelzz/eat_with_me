class ItemsPet < ActiveRecord::Base
  belongs_to :children_item
  belongs_to :pet

  delegate \
    :item,
    to: :children_item,
    prefix: false

  delegate \
    :name,
    :qualification,
    :points,
    to: :item,
    prefix: true

  delegate \
    :health_index,
    :health_icon,
    :coins,
    :feeling,

    to: :pet,
    prefix: true

  def happiness
    case item.qualification
    when "a-good"
      "/images/health/happy.png"
    when "b-neutral"
      "/images/health/neutral.png"
    when "c-bad"
      "/images/health/sad.png"
    end
  end
end

