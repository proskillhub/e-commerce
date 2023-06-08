class Admin::CategorysController < ApplicationController
  before_action :authenticate_user!
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
        render :new
      end
    end

    def edit
      @category = Category.find(params[:id])
  end

  def update
      @category = Category.find(params[:id])       
      if @category.update(category_params)
        redirect_to admin_categorys_url, notice: 'Category updated successfully .'
      else
        render :edit, status: :unprocessable_entity
      end
  end




    def destroy
      @category = Category.find(params[:id])
      @category.destroy
      redirect_to admin_categorys_url, notice: 'Category deleted successfully .'
    end
      private
    def category_params
      params.require(:category).permit(:name ,:parent_id)
    end
  end

