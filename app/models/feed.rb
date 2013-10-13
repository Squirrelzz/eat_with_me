class Feed < ActiveRecord::Base
  belongs_to :meal
  belongs_to :pet
end
