class Admins::OrdersController < ApplicationController
  def index
  	@orders = Order.all
  end

  def show
  	@order = Order.find(params[:id])
  	@customer = @order.customer
  	@order_details = @order.order_details
    @total_price = @order_details.sum(&:subtotal_price)
  end

  def update
  	@order = Order.find(params[:id])
  	@order.update(order_params)
    #注文ステータスが入金確認なら下の事をする
    if @order.order_status == "入金確認" 
      #製作ステータスを「製作待ちに」　更新
       @order.order_details.update(production_status: 1) 
       end
  	redirect_to admins_order_path(@order)
  end

  private
  def order_params
  	params.require(:order).permit(:order_status, order_details_attributes:[:production_status])
  end
end
