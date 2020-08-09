class CartItem < ApplicationRecord
	belongs_to :customer
	belongs_to :product

  # 小計
  def subtotal_price
	(count * product.non_taxed_price * Constants::TAX).round
  end
  # 合計
  def cart_item_sum
    total = 0
    cart_items.each do |cart_item|
      total += cart_item.subtotal_price
    end
    total
  end
end