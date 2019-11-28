class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :experience
  has_many :reviews, dependent: :destroy

  validates :date, presence: true
  validates :state, presence: true
end
