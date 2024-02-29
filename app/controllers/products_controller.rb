class ProductsController < ApplicationController
  before_action :authenticate_user!

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def show_cart
    @cart_items = current_user.cart_items.includes(:product)
  end

  def create
    @products = Product.new(product_params)
    @products.user_id = current_user.id
    return unless @products.save

    redirect_to vendor_products_path
    flash[:success] = 'Product Created Succesfully'
  end

  def add_to_cart
    product = Product.find(params[:product_id])
    current_user.cart_items.create(product: product)
    redirect_to show_cart_path
  end

  def remove_from_cart
    cart_item = current_user.cart_items.find(params[:id])
    cart_item.destroy
    redirect_to show_cart_path
  end

  def vendor_products
    @products = current_user.products
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :product_type)
  end
end
