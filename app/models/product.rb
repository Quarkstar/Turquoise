class Product < ApplicationRecord
  has_many :comments
  belongs_to :store
  validates :store_id, presence: true
  validates :info, presence: true, length: { maximum: 140 }
end
