class Order < ApplicationRecord
	belongs_to :customer
	has_many :order_details, dependent: :destroy
	#注文ステータス
	enum order_status: {入金待ち: 0, 入金確認: 1, 製作中: 2, 発送準備中: 3, 発送済み: 4}
	#支払方法
	enum order_method: {クレジットカード:0, 銀行振込:1}

	def total_item_count
		order_details = self.order_details
	    @total_count = 0
          order_details.each do |order_detail|
            @total_count += order_detail.ordered_item_count
          end
        return @total_count
	end
end
