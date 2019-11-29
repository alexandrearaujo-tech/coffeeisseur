class Review < ApplicationRecord
  belongs_to :booking
  belongs_to :compliment

  validates :rating, presence: true
end
