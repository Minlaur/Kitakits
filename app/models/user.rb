
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :user_languages
  has_many :languages, through: :user_languages
  has_many :user_nationalities
  has_many :nationalities, through: :user_nationality
  has_many :topics, dependent: :destroy
  has_many :availabilities, dependent: :destroy
  acts_as_taggable_on :expertises
end
