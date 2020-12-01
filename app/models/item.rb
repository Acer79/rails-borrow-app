class Item < ApplicationRecord
  has_many :order_items, inverse_of: :item, dependent: :destroy
  belongs_to :category

  validates :name, :description, :category_id, :buyer_id, presence: true
end
