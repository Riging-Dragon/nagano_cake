class Admins::ProductsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @admins_products = Product.page(params[:page]).reverse_order
    @genres = Genre.all
  end

  def new
    @admins_product = Product.new#商品の新規登録ページの表示
  end

  def create
    @admins_product = Product.new(product_params)#商品の新規登録
    if @admins_product.save
      redirect_to admins_product_path(@admins_product.id)
      flash[:notice] ='You have created product successfully.'
    else
      render :new
  end
end

  def update
    @admins_product = Product.find(params[:id])
    if @admins_product.update(product_params)
      redirect_to admins_product_path(@admins_product.id), notice: 'You have updated user successfully.'
    else
      render :edit
  end
end

  def show
    @admins_product = Product.find(params[:id])
    @genre = Genre.find(@admins_product.genre_id)


  end

  def edit
    @admins_product = Product.find(params[:id])
    p @admins_product
  end

  def product_params
    params.require(:product).permit(:genre_id, :image, :name, :description, :non_taxed_price,:is_capable,:category)
  end
end
