class Topic < ApplicationRecord
  belongs_to :tag
  belongs_to :user
  has_many :bookings, dependent: :destroy
end
