class ProductsController < ApplicationController

def index
	@genres = Genre.all
  	if params[:genre_id]
  		genre = Genre.find(params[:genre_id])
  		@products = genre.products
  	else
  		@products = Product.search(params[:search])
   end
end

def show
	@product = Product.find(params[:id])
  	@cart_item = CartItem.new(product_id: @product.id)
  	@genres = Genre.all
end
end
