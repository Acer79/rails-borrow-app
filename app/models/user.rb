class User < ApplicationRecord
  has_many :buyer_orders, class_name: "Order", foreign_key: :buyer, inverse_of: :buyer, dependent: :destroy
  has_many :seller_orders, class_name: "Order", foreign_key: :seller, inverse_of: :seller, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, presence: true, length: { minimum: 2, maximum: 25 }
  validates :last_name, presence: true, length: { minimum: 2, maximum: 25 }

  def full_name
    return "#{first_name} #{last_name}" if first_name || last_name
    "Anonymous"
  end
end
