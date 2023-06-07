class Admin::CategorysController < ApplicationController
  def index
    @categorys=Category.where(parent_id: nil)
  end
  def new
    @category=Category.new
  end
    def create
    
      @category = Category.new(category_params)
    
      if @category.save
        redirect_to admin_categorys_url, notice: 'Category was successfully created.'
      else
        render :index
      end
    end
      private
    def category_params
      params.require(:category).permit(:name ,:parent_id)
    end
  end

