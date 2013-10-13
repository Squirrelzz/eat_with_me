class Pet < ActiveRecord::Base
  has_many :feeds
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
      "b-bad"     => -1,
      "c-neutral" =>  0
    }

    feeds.map(&:meal).map(&:qualification).map{|q| values[q] }.inject(:+).to_f / feeds.count
  end
end
