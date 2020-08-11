class Admins::OrdersController < ApplicationController
  def index
  	@orders = Order.all
    end
  end

  def show
  	@order = Order.find_by(id: params[:id])
  	@customer = @order.customer
  	@order_details = @order.order_details
    @total_price = @order_details.sum(&:subtotal_price)
  end

  def update
  	@order = Order.find(params[:id])
  	@order.update(order_params)
  	redirect_to admins_order_path(@order)
  end

  private
  def order_params
  	params.require(:order).permit(:order_status, order_details_attributes:[:production_status])
  end
end
