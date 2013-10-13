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
      "/assets/health/happiest.png"
    elsif health_index > 0.6
      "/assets/health/happy.png"
    elsif health_index > 0.4
      "/assets/health/neutral.png"
    elsif health_index > 0.2
      "/assets/health/sad.png"
    else
      "/assets/health/saddest.png"
    end
  end
end
