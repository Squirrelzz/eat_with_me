class Pet < ActiveRecord::Base
  has_many :feeds
  belongs_to :character
  belongs_to :person

  delegate :name, to: :person, prefix: true
  delegate :image_url, to: :character
end
