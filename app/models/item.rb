class Item < ApplicationRecord
  has_many :order_items, inverse_of: :item, dependent: :destroy
  belongs_to :category
  has_one_attached :image

  validates :name, :description, :category_id, :buyer_id, presence: true
end
