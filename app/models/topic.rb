# Topic
# Table name: topics
#  id          :bigint           not null, primary key
#  name        :string
#  description :text
#  status      :integer          default("pending")
#  user_id     :bigint
#  tag_id      :bigint
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#


class Topic < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  acts_as_taggable_on :tags

  validates :name, presence: true, length: { minimum: 1, maximum: 100 }
  validates :description, presence: true, length: { minimum: 1, maximum: 1000 }

  enum status: { pending: 0, confirmed: 1, cancelled: 2}

end
