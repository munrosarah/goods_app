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
  
  def edit
    @product = Product.find(params[:id])
  end
  
  def update
    @product = Product.find(params[:id])
    if @product.update_attributes(params[:product])
      flash[:success] = "Product updated"
      redirect_to @product
    else
      render 'edit'
    end
  end
  
  def index
    @products = Product.paginate(page: params[:page], per_page: 12)
  end
  
end
