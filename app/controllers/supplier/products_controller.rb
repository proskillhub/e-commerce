class Supplier::ProductsController < ApplicationController
        def index
            @products = Product.all
        end
    
        def show
            @product = Product.find(params[:id])
        end
    
        def new
            @product = Product.new
        end
    
        def create
            @product = Product.new(product_params)    
            @product[:category_id]=2
            if @product.save
              redirect_to [:supplier,@product]
            else
              render :show, status: :unprocessable_entity
            end
        end

        def edit
            @product = Product.find(params[:id])
        end

        def update
            @product = Product.find(params[:id])       
            if Product.update(product_params)
              redirect_to [:supplier,@product]
            else
              render :edit, status: :unprocessable_entity
            end
        end
    
        private
        def product_params
          params.require(:product).permit(:name, :current_price, :actual_price, :image)
        end
end