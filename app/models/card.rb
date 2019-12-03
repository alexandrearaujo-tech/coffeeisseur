class Card < ApplicationRecord
  belongs_to :place
  belongs_to :user
  enum state: {
    active: 0,
    completed: 1,
    redeemed: 2
  }
end
