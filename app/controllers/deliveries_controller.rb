class DeliveriesController < ApplicationController
  def index
    @delivery = Delivery.new
    @deriveries = current_customer.deliveries
  end

  def create
    @delivery = Delivery.new(delivery_params)
    @delivery.customer_id = current_customer.id
    if @delivery.save
      flash[:notice] = "配送先を登録しました"
      redirect_to deliveries_path
    else
      render action: :index
    end
  end

  def edit
    @delivery = Delivery.find(params[:id])
  end

  def update
    @delivery_address = Delivery.find(params[:id])
    if @delivery_address.update(delivery_params)
      flash[:notice] = "配送先を編集しました。"
      redirect_to deliveries_path
    else
      render action: :edit
    end
  end

  def destroy
    @delivery_address = Delivery.find(params[:id])
    @delivery_address.destroy
    flash[:notice] = "配送先を削除しました。"
    redirect_to deliveries_path
  end

  private
  def delivery_params
    params.require(:delivery).permit(:delivery_name, :delivery_zip_code, :delivery_address)
  end
end
