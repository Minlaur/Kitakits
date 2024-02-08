class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :user_languages
  has_many :languages, through: :user_languages
  has_many :user_nationality
  has_many :nationality, through: :user_nationality
  has_many :requests, dependent: :destroy
  has_many :bookings, through: :requests, dependent: :destroy
  has_many :availability, dependent: :destroy
end
