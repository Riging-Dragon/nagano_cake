class Admins::OrdersController < ApplicationController
  def index
  	@orders = Order_detail.all
  end

  def show
  	@customer = Customer.find_by(id: params[:id])
  	@order = 
  end
end
