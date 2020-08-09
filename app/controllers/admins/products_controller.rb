class Admins::ProductsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @admins_products = Product.page(params[:page]).reverse_order
  end

  def new
    @admins_products = Product.new
  end

  def create
    @admins_products = Product.new(product_params)
    if @admins_products.save
      redirect_to admins_product_path(admins_product.id)
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
    @admins_products = Product.find(params[:id])
    @genre = Genre.find(@admins_product.genre_id)
  end

  def edit
    @admins_products = Product.find(params[:id])
  end
  def product_params
    params.require(:product).permit(:genre_id, :image, :name, :description, :non_tax_price)
  end
end
