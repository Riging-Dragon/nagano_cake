class CustomersController < ApplicationController
  def show
  end

  def resign_page
  end

  def edit
  	@customer = current_customer
  end

  def update
  	@customer = current_customer
  	if @customer.update(customer_params)
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

    private
  def customer_params
    params.require(:customer).permit(:last_name_kanji, :first_name_kanji, :last_name_kana, :first_name_kana, :zip_code, :address, :phone_number, :email)
  end
end
