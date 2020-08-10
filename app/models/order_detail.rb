class OrderDetail < ApplicationRecord
	belongs_to :order
	belongs_to :product

	enum production_status: {着手不可: 0, 製作待ち: 1, 製作中: 2, 製作完了: 3}
	def subtotal_price
		#Constants::TAX = 1.1
	(ordered_item_count * ordered_price * 1.1).round
  end
end
