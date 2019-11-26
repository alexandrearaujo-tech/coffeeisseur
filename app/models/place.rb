class Place < ApplicationRecord
  has_many :cards
  has_many :experiences
  has_many :user_places

  def reviews
    Review.joins(bookings: :experiences).where(place_id: self.id)
  end
end
