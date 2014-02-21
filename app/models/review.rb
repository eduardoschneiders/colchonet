class Review < ActiveRecord::Base
	POINTS = (1..5).to_a

  belongs_to :user
  belongs_to :room, counter_cache: true

  validates_uniqueness_of :user_id, scope: :room_id
  validates_uniqueness_of :room_id, scope: :user_id

	validates_inclusion_of :points, in: POINTS

  def self.stars
    (average(:points) || 0).round
  end
end
