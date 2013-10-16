class Pet < ActiveRecord::Base

  has_many :items_pets, dependent: :destroy
  has_many :children_items, through: :items_pets
  has_many :items, through: :children_items

  belongs_to :character
  belongs_to :child, class_name: "User", foreign_key: :user_id

  delegate :name, to: :child, prefix: true
  delegate :image_url, to: :character

  def coins
    points.inject(:+)
  end

  def points
    @points ||= items.map(&:points)
  end

  def health_index
    return 0.5 if items.empty?

    values = {
      "a-good"    =>  1,
      "b-neutral" =>  0,
      "c-bad"     => -1
    }

    (items.map(&:qualification).map{|q| values[q] }.inject(:+).to_f / items.count + 1) / 2
  end

  def feeling
    if health_index > 0.8
      "great!"
    elsif health_index > 0.6
      "good"
    elsif health_index > 0.4
      "ok"
    elsif health_index > 0.2
      "upset"
    else
      "very sad"
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
