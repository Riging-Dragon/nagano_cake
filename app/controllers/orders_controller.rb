class OrdersController < ApplicationController
  before_action :set_customer

  def new
  	@order = Order.new
  end

  def confirm
  end

  def create
  	if current_customer.cart_items.exists?
  		@order = Order.new(order_params)
  		@order.customer_id = current_customer.id
  	end
  end

  def top
  end

  private
  def set_customer
  	@customer = current_customer
  end

  def order_params
  	params.require(:order).permit(:customer_id, :ordered_date, :order_status, :ordered_zip_code, :ordered_address, :ordered_name, :total_price, :ordered_postage, :order_method
  end

end
