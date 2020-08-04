class CartItemsController < ApplicationController
  def index
    @customer = Customer.find(current_customer[:id])
  end

  def create
    @cart_item = current_customer.cart_items.new(cart_item_params)
    if @cart_item.save
      redirect_to cart_items_path
    end
  end

  def update
  end

  def destroy
  end

  def destroy_all
      @customer = Customer.find(current_customer[:id])
      if customer.cart_items.destroy_all
      flash[:notice] = "カート内の商品を全て削除しました。"
      redirect_to cart_items_path(@book)
    else
      render action: :index
    end
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:count,:product_id)
  end
end
