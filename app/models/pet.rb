class Pet < ActiveRecord::Base
  has_many :feeds, dependent: :destroy
  belongs_to :character
  belongs_to :person

  delegate :name, to: :person, prefix: true
  delegate :image_url, to: :character

  def coins
    feeds.map(&:meal).map(&:points).inject(:+)
  end

  def health_index
    values = {
      "a-good"    =>  1,
      "b-neutral" =>  0,
      "c-bad"     => -1
    }

    feeds.map(&:meal).map(&:qualification).map{|q| values[q] }.inject(:+).to_f / feeds.count
  end

  def health_icon
    if health_index > 0.8
      "/assets/scale/state-5.png"
    elsif health_index > 0.6
      "/assets/scale/state-4.png"
    elsif health_index > 0.4
      "/assets/scale/state-3.png"
    elsif health_index > 0.2
      "/assets/scale/state-2.png"
    else
      "/assets/scale/state-1.png"
    end
  end
end
