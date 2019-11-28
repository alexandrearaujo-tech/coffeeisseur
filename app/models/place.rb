class Place < ApplicationRecord
  has_many :cards
  has_many :experiences
  has_many :bookings, through: :experiences
  has_many :user_places

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_street?

  mount_uploader :photo, PhotoUploader

  validates :name, presence: true, uniqueness: true
  validates :city, presence: true
  validates :street, presence: true
  validates :photo, presence: true
  include AlgoliaSearch

  def address
    "#{street}, #{city}"
  end

  def reviews
    Review.joins(booking: :experience).where("experiences.place_id = ?", self.id)
  end

  include PgSearch::Model
  pg_search_scope :global_search,
    against: [:name, :city, :street],
    using: {
      tsearch: { prefix: true }
    }

  # algoliasearch do

  # end

end
