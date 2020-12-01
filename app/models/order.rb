class Order < ApplicationRecord
  has_many :order_items, inverse_of: :order, dependent: :destroy
  belongs_to :seller, class_name: "User", inverse_of: :seller_orders
  belongs_to :buyer, class_name: "User", inverse_of: :buyer_orders
end
