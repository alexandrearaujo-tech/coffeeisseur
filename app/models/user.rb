class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :cards
  has_many :bookings, dependent: :destroy
  has_many :user_experiences
  has_many :user_places
  has_many :user_interests

  validates :email, presence: true, format: { with: /\A.*@.*\.*\z/ }
  validates :first_name, presence: true
  validates :last_name, presence: true
end
