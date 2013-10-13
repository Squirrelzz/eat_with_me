class Feed < ActiveRecord::Base
  belongs_to :meals_person
  belongs_to :pet

  delegate :meal, to: :meal_person, prefix: false
  delegate :name, :qualification, to: :meal_person, prefix: true

  delegate \
    :health_index,
    :health_icon,
    :coins,
    to: :pet,
    prefix: true

    def happiness
      case meals_person.meal.qualification
      when "a-good"
        "/assets/health/happy.png"
      when "b-neutral"
        "/assets/health/neutral.png"
      when "c-bad"
        "/assets/health/sad.png"
      end
    end
end

