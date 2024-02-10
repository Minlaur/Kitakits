class Topic < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  acts_as_taggable_on :tags
end
