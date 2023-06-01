class Customer::CartsController < ApplicationController
  def index
    @cart_items = current_user.carts.where(isorder:false).first.cart_items
  end

  def new
  @cart_item = current_user.carts.where(isorder:false).first.cart_items.where(product_id:params[:product_id])
  debugger
  if @cart_item.empty?
    debugger
      @cart_item = current_user.carts.first.cart_items.new(price: params[:price], quantity: 1,product_id:params[:product_id])
      @cart_item.save
  else
    @cart_item.update(quantity:(@cart_item.first.quantity + 1))
  end    
    redirect_to customer_carts_path
  end
end
