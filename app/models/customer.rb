class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :orders, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  has_many :deliveries, dependent: :destroy
  validates :last_name_kanji, presence: true
  validates :first_name_kanji, presence: true
  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :zip_code, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true
  validates :email, presence: true

  def cart_item_sum
    total = 0
    cart_items.each do |cart_item|
      total += (cart_item.product.non_taxed_price * 1.1).floor * cart_item.count
    end
    total
  end
end
