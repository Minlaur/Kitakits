class Review < ApplicationRecord
  belongs_to :user

  # rating between 1 and 5
  validates :rating, presence: true, numericality: { only_integer: true, greater_than: 0, less_than: 6 }
  validates :content, presence: true, length: { minimum: 5 }
end
