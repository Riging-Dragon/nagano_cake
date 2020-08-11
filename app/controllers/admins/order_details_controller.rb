class Admins::OrderDetailsController < ApplicationController
  def update
  	@order_detail = OrderDetail.find(params[:id])
  	@order = @order_detail.order
  	@order_detail.update(order_detail_params)
  	if @order_detail.production_status == "製作中" #製作ステータスが「製作中」なら入る
       @order.update(order_status: 2) #注文ステータスを「製作中」　に更新
       #上記の条件に当てはまらなければ、商品の個数の特定　　　　製作ステータスが「製作l完了」の商品をカウント
	#数が一致すれば、全ての商品の製作ステータスが「製作完了」だとわかる
	elsif @order.order_details.count ==  @order.order_details.where(production_status: "製作完了").count
			@order.update(order_status: 3) #注文ステータスを「発送準備中]に更新
	end
  	redirect_to admins_order_path(@order)
  end
  private
  def order_detail_params
  	params.require(:order_detail).permit(:production_status)
  end
end
