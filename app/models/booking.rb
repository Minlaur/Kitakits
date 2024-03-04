class Booking < ApplicationRecord
  belongs_to :topic
  belongs_to :user # the user who booked the availability
  has_many :messages, dependent: :destroy

  validates :status, presence: true
  validates :time, presence: true
  enum status: { pending: 0, accepted: 1, rejected: 2}

end
