class CartItem < ApplicationRecord
	belongs_to :customer
	belongs_to :product

  # 小計
  def subtotal_price
	(count * product.non_taxed_price * Constants::TAX).round
  end
  # 合計

end