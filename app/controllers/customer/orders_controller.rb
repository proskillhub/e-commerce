class Customer::OrdersController < ApplicationController
    def new
        @cart = Cart.find(params[:cart_id])
        @order = Order.new
        @total = params[:total_price]
        session[:cart_id] = @cart.id
    end

    def create
        @order = current_user.orders.new(order_params)       
        @order[:cart_id] = session[:cart_id]     
        if @order.save
          redirect_to [:customer,@order]
        else
          render :show, status: :unprocessable_entity
        end
    end

    private
        def order_params
          params.require(:order).permit(:name, :email, :address, :number, :total)
        end
end
