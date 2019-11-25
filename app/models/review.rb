class Review < ApplicationRecord
  belongs_to :booking
  belongs_to :compliment
end
