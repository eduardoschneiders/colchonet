class Room < ActiveRecord::Base
  has_many :reviews, dependent: :destroy
  has_many :revewed_rooms, through: :reviews, source: :room
  belongs_to :user

  scope :most_recent, -> {order('created_at DESC')}

  def complete_name
    "#{title}, #{location}"
  end

  def self.search(query)
    if query.present?
      where(['location LIKE :query OR
              title LIKE :query OR
              description LIKE :query', query: "%#{query}%"])
    else
      scoped
    end
  end

  def to_param
    "#{id}-#{title.parameterize}"
  end
end
