class HomesController < ApplicationController
  def top
  	if params[:search]

  		#genre = Genre.find(params[:genre_id])
  		#@products = genre.products
      @genre = Genre.search(params[:search])
      if @genre.present?#変数の中身が空かあるかをチェックする。(present)
        @genre_id = @genre.first.id#genre_idの中の配列の中の最初のidを持ってくる。
      end
      @products = Product.where(genre_id: @genre_id)
      @genres = Genre.all
  	else
      @genres = Genre.all
      @products = Product.all
  end
end

  def about
  end
end
