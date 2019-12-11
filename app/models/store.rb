class Store < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :info, presence: true, length: { maximum: 140 }
end
