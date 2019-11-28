class Experience < ApplicationRecord
  belongs_to :category
  belongs_to :place
  has_many :bookings
  has_many :user_experiences

  mount_uploader :photo, PhotoUploader

  validates :name, presence: true
  validates :description, presence: true
  validates :photo, presence: true
end
