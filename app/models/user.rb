# documentation model User
# This model is used to create a user and store the user's information in the database. It also has a method to format the date and time.
# Attributes:
# - first_name: string
# - last_name: string
# - email: string
# - password: string
# - nickname: string





class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attribute :last_seen, :datetime

  has_one_attached :picture
  has_many :topics, dependent: :destroy
  has_many :messages
  # need to add relationship between User and booking
  # has_many :bookings
  # has_many :bookings_as_sempais through: :topics
  # end
  # in the table, tags
  acts_as_taggable_on :tags
  acts_as_taggable_on :expertises

  validates :email, presence: true, length: { minimum: 1, maximum: 100 }
  validates :password, presence: true, length: { minimum: 1, maximum: 100 }
  validates :nationality, presence: true
  validates :language, presence: true
  validates :nickname, presence: true

  if :sempai == true
    validates :occupation, presence: true
    validates :background, presence: true
    validates :first_name, presence: true, length: { minimum: 1, maximum: 100 }
    validates :last_name, presence: true, length: { minimum: 1, maximum: 100 }
  end


  # method to format dates and time
  def start_date_time
    start_date_time.strftime("%m/%d/%Y at %I:%M%p")
  end

  def end_date_time
    end_date_time.strftime("%m/%d/%Y at %I:%M%p")
  end

  def sempai?
    sempai
  end

end
