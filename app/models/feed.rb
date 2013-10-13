class Feed < ActiveRecord::Base
  belongs_to :meal
  belongs_to :pet

  delegate :name, to: :meal, prefix: true
  delegate \
    :health_index,
    :health_icon,
    :coins,
    to: :pet,
    prefix: true
end
