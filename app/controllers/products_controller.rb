class ProductsController < ApplicationController
  before_filter :signed_in_user, only: [:index, :create, :edit, :update, :destroy, :new]
  before_filter :correct_user,   only: [:edit, :update, :destroy]
  
  def show
    @product = Product.find(params[:id])
  end
  
  def new
    @product = current_user.products.build if signed_in?
  end
  
  def create
    @product = current_user.products.build(params[:product]) if signed_in?
    if @product.save
      flash[:success] = "Product created!"
      redirect_to @product
    else
      render 'new'
    end
  end
  
  def edit
    @product = Product.find(params[:id]) if signed_in?
  end
  
  def update
    @product = Product.find(params[:id]) if signed_in?
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
  
  def destroy
  
  end
  
  private
    
    def correct_user
      @product = Product.find(params[:id])
      @user = User.find(@product.user_id)
      redirect_to(root_path) unless current_user?(@user)
    end
  
end
