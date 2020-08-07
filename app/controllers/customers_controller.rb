class CustomersController < ApplicationController
  def show
  end

  def resign_page
  end

  def edit
  	@customer = Customer.new
  end

  def update
  	@customer = current_user
  	if @customer.update
			flash[:notice] = "会員情報を更新しました"
			redirect_to customers_path
		else
			render :edit
		end
  end

  def resign
  	@customer = current_customer
    #is_enabledのdefault値はtrueとする。
    @customer.update(is_enabled: false)
    ##ログアウト
    reset_session
    flash[:notice] = "ありがとうございました。引き続き長野CAKEをよろしくお願いいたします。"
    redirect_to root_path
  end
end
