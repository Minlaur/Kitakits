class Booking < ApplicationRecord
  belongs_to :topic
  belongs_to :user # the user who booked the availability

  validates :time, presence: true
  validates :status, presence: true
  enum status: { pending: 0, confirmed: 1, cancelled: 2}

  def pending?
    status == 'pending'
  end

  def accepted?
    status == 'accepted'
  end

  def rejected?
    status == 'rejected'
  end
end
