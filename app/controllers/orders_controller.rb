class OrdersController < ApplicationController
  before_action :set_customer

  def new
  	@order = Order.new
  end

  def confirm
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end

  def create
  		@order = Order.new(order_params)
  		@order.customer_id = current_customer.id
  		#顧客の配送先全てを@ods(ordered_deliveries)とする。
  		@ods = @customer.deliveries
        
  		@add = params[:order][:add].to_i
  		case @add
  			#現住所が送り先の場合
	  		when 1
	  			@order.ordered_zip_code = @customer.zip_code
	  			@order.ordered_address = @customer.address
	  			@order.ordered_name = @customer.last_name_kanji + @customer.first_name_kanji
	  		#配送先一覧から選ぶ場合
	  		when 2
	  			@od = @ods.find(params[:id])
	  			@order.ordered_zip_code = @od.zip_code
	  			@order.ordered_address = @od.address
	  			@order.ordered_name = @od.delivery_name
	  		#新規登録した配送先の場合
	  		when 3
	  			@order.ordered_zip_code = params[:order][:zip_code]
	  			@order.ordered_address = params[:order][:delivery_address]
	  			@order.ordered_name = params[:order][:delivery_name]
	  		end

	  		if @order.save
          redirect_to confirm_path(@order)
        else
          render :new
        end  		      			
  end

  def top
  end

  private
  def set_customer
  	@customer = current_customer
  end

  def order_params
  	params.require(:order).permit(:customer_id, :ordered_date, :order_status, :ordered_zip_code, :ordered_address, :ordered_name, :total_price, :ordered_postage, :order_method, order_details_atributes: [:customer_id, :product_id, :ordered_price, :ordered_item_count, :production_status])
  end

end
