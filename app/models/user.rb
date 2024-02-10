# documentation:
  # This is the User model. It is the main model of the application. It has many relationships with other models.
  #  It has many validations to ensure that the user has all the necessary information to be able to use the application.
  #  It also has a conditional validation that is only true if the user is a sempai.
  #  This is because the sempai has more information to fill in than the user.
  #  The sempai has to fill in the occupation, background, start_date_time, and end_date_time.

class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :user_languages
  has_many :languages, through: :user_languages
  has_many :user_nationalities
  has_many :nationalities, through: :user_nationality
  has_many :topics, dependent: :destroy
  has_many :availabilities, dependent: :destroy

  validates :first_name, presence: true, length: { minimum: 1, maximum: 100 }
  validates :last_name, presence: true, length: { minimum: 1, maximum: 100 }
  validates :email, presence: true, length: { minimum: 1, maximum: 100 }
  validates :password, presence: true, length: { minimum: 1, maximum: 100 }
  validates :nationality, presence: true
  validates :Language, presence: true
  validates :nickname, presence: true

  if :sempai == true
    validates :occupation, presence: true
    validates :background, presence: true
    validates :start_date_time, presence: true
    validates :end_date_time, presence: true
  end


  # TODO:  method to format dates and time


end
