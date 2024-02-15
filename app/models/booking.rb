class Booking < ApplicationRecord
  belongs_to :topic
  belongs_to :user # the user who booked the availability
  has_many :messages

  enum status: { pending: 0, confirmed: 1, cancelled: 2}
end
