class Booking < ApplicationRecord
  belongs_to :topic
  belongs_to :availability
  belongs_to :user # the user who booked the availability

  validates :time, presence: true

  enum status: { pending: 0, confirmed: 1, cancelled: 2}
end
