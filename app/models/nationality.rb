class Nationality < ApplicationRecord
  has_many :users, through: :user_nationality
end
