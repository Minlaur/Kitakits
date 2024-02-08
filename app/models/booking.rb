class Booking < ApplicationRecord
  belongs_to :topic
  belongs_to :availability
  belongs_to :user # the user who booked the availability
end
