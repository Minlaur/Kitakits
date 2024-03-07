class Booking < ApplicationRecord
  belongs_to :topic
  belongs_to :user # the user who booked the availability
  has_many :messages, dependent: :destroy

  validates :status, presence: true
  validates :time, presence: true
  enum status: { pending: 0, accepted: 1, rejected: 2}

  def google_url
    "https://calendar.google.com/calendar/r/eventedit?text=Chat%20with%20Sempai&details=Hi,%20Use%20this%20time%20to%20ask%20questions,%20seek%20guidance,%20and%20learn%20from%20their%20expertise%20or%20experience.%20Please%20come%20prepared%20with%20topics%20or%20questions%20you'd%20like%20to%20discuss.&location=Online"
  end
end
