class Pet < ActiveRecord::Base

  has_many :items_pets, dependent: :destroy
  has_many :children_items, through: :items_pets
  has_many :items, through: :children_items

  belongs_to :character
  belongs_to :child, class_name: "User", foreign_key: :user_id

  delegate :name, to: :child, prefix: true
  delegate :image_url, to: :character
  delegate :name, to: :character, prefix: true

  def coins
    points.inject(:+)
  end

  def points
    @points ||= items.map(&:points)
  end

  def health_index
    return nil if last_items.empty?

    values = {
      "a-good"    =>  1,
      "b-neutral" =>  0,
      "c-bad"     => -1
    }

    ((last_items.map(&:qualification).map { |q|
      values[q]
    }.inject(:+).to_f / last_items.count + 1) / 2).round(2)
  end

  def last_items
    self.items_pets.map(&:item).last(5)
  end

  def health_level
    return 3 unless health_index.present?

    return 0 if                     health_index <= 0.2
    return 1 if health_index  > 0.2 and health_index <= 0.4
    return 2 if health_index  > 0.4 and health_index <= 0.6
    return 3 if health_index  > 0.6 and health_index <= 0.8
    return 4 if health_index  > 0.8
  end

  def feeling
    case health_level
    when 0
      "very sad"
    when 1
      "upset"
    when 2
      "ok"
    when 3
      "good"
    else
      "great!"
    end
  end

  def health_icon
    "/images/scale/state-#{health_level + 1}.png"
  end

  def pet_image
    state = %w[
      sick
      nogood
      normal
      happy
      ecstatic
    ][health_level]

    "/images/pets/#{character_name}_#{state}.svg"
  end

  def pet_eating_image
    "/images/pets/#{character_name}_eating.svg"
  end
end
