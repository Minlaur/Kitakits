class Booking < ApplicationRecord
  belongs_to :topic
  belongs_to :availability
end
