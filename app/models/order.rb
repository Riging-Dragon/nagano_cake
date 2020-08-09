class Order < ApplicationRecord
	belongs_to :order
	has_many :order_details
	#注文ステータス
	enum order_status: {入金待ち: 0, 入金確認: 1, 製作中: 2, 発送準備中: 3, 発送済み: 4}
	#支払方法
	enum order_method: {クレジットカード:0,　銀行振込:1}

	def total_sum
		total = 0
	    order_details = Order.order_details
	    order_details.each do |order_detail|
	        total = order_detail.ordered_price * order_detail.ordered_item_count *1.1
	        total += total
	    end
	    total
	end
end
