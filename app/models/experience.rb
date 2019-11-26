class Experience < ApplicationRecord
  belongs_to :category
  belongs_to :place
  has_many :bookings
  has_many :user_experiences
end
