class Place < ApplicationRecord
  has_many :cards
  has_many :experiences
  has_many :user_places
end
