class OrdersController < ApplicationController
  before_action :set_customer
  #(customer_id: @customer.id)は必要？
  def new
  	@order = Order.new
    @deliveries = @customer.deliveries.all
  end

  def confirm
    @order = Order.new(order_params)
    @order.order_method = params[:order][:order_method]
    
    #f.collection_selectで渡すための配列を作成
    @deliveries = @customer.deliveries

    add = params[:order][:add].to_i
      case add
        #現住所が送り先の場合
        when 1
          @order.ordered_zip_code = @customer.zip_code
          @order.ordered_address = @customer.address
          @order.ordered_name = @customer.last_name_kanji + @customer.first_name_kanji
        #配送先一覧から選ぶ場合
        #送られる変数を要確認 params[:order][:ordered_address]を確認
        #@address=Delivery.find_by(zip_code: params[:order][:ordered_address]) 
        #@order.ordered_address=@address.delivery_address ...
        when 2
          @order.ordered_zip_code = @od.zip_code
          @order.ordered_address = @od.address
          @order.ordered_name = @od.delivery_name
        #新規登録した配送先の場合
        #下記、記述の必要なし？
        when 3
          @order.ordered_zip_code = params[:order][:zip_code]
          @order.ordered_address = params[:order][:delivery_address]
          @order.ordered_name = params[:order][:delivery_name]
      end
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.ordered_date = Datetime.now
        #cart_itemsの商品を一つずつorder_detailへとデータ移行
    @order_detail = Order_detail.new
      @customer.cart_items.each do |cart_item|
        @order_detail = @order.order_details.build
        @order_detail.order_id = @order.id
        @order_detail.product_id = cart_item.product_id
        @order_detail.ordered_price =  cart_item.product.non_taxed_price
        @order_detail.ordered_item_count = cart_item.count 
      end
    @order_detail.save

    @total_price = @order.order_details.subtotal_price
    @ordered_postage = 800

    @customer.cart_item.destroy
    
    if @order.save
      render :top
    else
      redirect_to products_path
      flash[:danger] = 'カートが空です。'
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
