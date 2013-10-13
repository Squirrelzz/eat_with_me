class Pet < ActiveRecord::Base
  has_many :feeds, dependent: :destroy
  belongs_to :character
  belongs_to :person

  delegate :name, to: :person, prefix: true
  delegate :image_url, to: :character

  def coins
    feeds.map(&:meals_person).map(&:meal).map(&:points).inject(:+)
  end

  def health_index
    return 0.5 if feeds.count == 0

    values = {
      "a-good"    =>  1,
      "b-neutral" =>  0,
      "c-bad"     => -1
    }

    feeds.map(&:meals_person).map(&:meal).map(&:qualification).map{|q| values[q] }.inject(:+).to_f / feeds.count
  end

  def feeling
    if health_index > 0.8
      "great!"
    elsif health_index > 0.6
      "good."
    elsif health_index > 0.4
      "ok."
    elsif health_index > 0.2
      "upset."
    else
      "very sad."
    end
  end

  def health_icon
    if health_index > 0.8
      "/images/scale/state-5.png"
    elsif health_index > 0.6
      "/images/scale/state-4.png"
    elsif health_index > 0.4
      "/images/scale/state-3.png"
    elsif health_index > 0.2
      "/images/scale/state-2.png"
    else
      "/images/scale/state-1.png"
    end
  end

  def pet_image
    if health_index < 0.4
      "#{image_url}_sad.png"
    else
      "#{image_url}_close.png"
    end
  end
end
