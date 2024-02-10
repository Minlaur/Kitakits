class Topic < ApplicationRecord
  belongs_to :tag
  belongs_to :user
  has_many :bookings, dependent: :destroy

  validates :name, presence: true, length: { minimum: 1, maximum: 100 }
  validates :description, presence: true, length: { minimum: 1, maximum: 1000 }

  enum status: { pending: 0, confirmed: 1, cancelled: 2}

end
