class Place < ApplicationRecord
  has_many :cards
  has_many :experiences
  has_many :bookings, through: :experiences
  has_many :user_places

  def reviews
    Review.joins(booking: :experience).where("experiences.place_id = ?", self.id)
  end
end
