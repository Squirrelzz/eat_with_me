class Feed < ActiveRecord::Base
  belongs_to :meal
  belongs_to :pet

  delegate :name, :qualification, to: :meal, prefix: true
  delegate \
    :health_index,
    :health_icon,
    :coins,
    to: :pet,
    prefix: true
    
    def happiness
      case meal_qualification
      when "a-good"
        "/assets/health/happy.png"
      when "b-neutral"
        "/assets/health/neutral.png"
      when "c-bad"
        "/assets/health/sad.png"
      end
    end
end

