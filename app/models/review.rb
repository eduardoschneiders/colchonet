class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :room, counter_cache: true
end
