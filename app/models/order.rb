class Order < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  has_many :order_items, dependent: :destroy
end
