class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :experience
  has_one :review, dependent: :destroy

  validates :date, presence: true
  validates :state, presence: true
end
