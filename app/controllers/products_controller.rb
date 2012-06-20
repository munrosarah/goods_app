
class ProductsController < ApplicationController
  
  def show
    @product = Product.find(params[:id])
  end
 
  def new
    @product = Product.new
  end
  
  def create
    @product = Product.new(params[:product])
    if @product.save
      redirect_to @product
    else
      render 'new'
    end
  end
  
  def index
    @products = Product.all
  end
  
end
