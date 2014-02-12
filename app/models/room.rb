class Room < ActiveRecord::Base
  scope :most_recent, -> {order('created_at DESC')}
  belongs_to :user

  def complete_name
    "#{title}, #{location}"
  end
end
