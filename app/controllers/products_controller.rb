class ProductsController < ApplicationController
#ログインユーザーのみproduct#indexは閲覧可
  before_action :authenticate!, except: [:index]
#上に同じ退会済みユーザー
  before_action :customers_id_deleted, except: [:index]
  def index
  	@products = Product.all
  	@products = Product.where(genre_id: params[:genre_id])
  	@genres = Genre.all

  end

  def show
  	@product = Product.find(params[:id])
  	@cart_item = CartItem.new(product_id: @product.id)
  	@genres = Genre.all
  end
  private
  #ストロングパラメーター
  def product_params
  	params.require(:product).permit(:genre_id,:name,:image,:description,:non_taxed_price,:postage,:is_capable)
  end
end
