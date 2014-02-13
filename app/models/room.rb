class Room < ActiveRecord::Base
  has_many :reviews, dependent: :destroy
  has_many :revewed_rooms, through: :reviews, source: :room
  belongs_to :user

  scope :most_recent, -> {order('created_at DESC')}

  def complete_name
    "#{title}, #{location}"
  end
end
