class ProductsController < ApplicationController

def index
  @genre = Genre.all
  	if params[:search].nil?


  		#@products = genre.products
      #@genre = Genre.search(params[:search])
      #if @genre.present?#変数の中身が空かあるかをチェックする。(present)
        #@genre_id = @genre.first.id#genre_idの中の配列の中の最初のidを持ってくる。
      #end
      #@products = Product.where(genre_id: @genre_id)
      #@genres = Genre.all
      @products = Product.all
  	else
      #@genres = Genre.all
      @products = Product.where('name LIKE ?', "%#{params[:search]}%")
   end
end

def show
	@product = Product.find(params[:id])
  	@cart_item = CartItem.new(product_id: @product.id)
  	@genres = Genre.all
end
def product_params
    params.require(:product).permit(:genre_id, :name, :description, :non_taxed_price,:is_capable)
  end
end
