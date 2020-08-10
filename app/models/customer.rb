class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :orders, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  has_many :deliveries, dependent: :destroy

  def cart_item_sum
    total = 0
    cart_items.each do |cart_item|
      total += (cart_item.product.non_taxed_price * 1.1).floor * cart_item.count
    end
    total
  end
end
