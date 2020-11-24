class Item < ApplicationRecord
  has_many :user_items
  has_many :users, through: :user_items
  belongs_to :category

  validates :name, :description, :category_id, presence: true
end
