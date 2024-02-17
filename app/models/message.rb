class Message < ApplicationRecord
  has_many_attached :images, dependent: :destroy

  belongs_to :booking
  belongs_to :user
  validates :content, presence: true, length: { minimum: 1, maximum: 1000 }

end
