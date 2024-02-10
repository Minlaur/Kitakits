class Message < ApplicationRecord
  belongs_to :bookings
  belongs_to :users
  validates :content, presence: true, length: { minimum: 1, maximum: 1000 }

end
