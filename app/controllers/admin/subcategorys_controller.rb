class Admin::SubcategorysController < ApplicationController
  def index
    @category1=Category.find(1).subcategories
    @category4=Category.find(4).subcategories
    @category5=Category.find(5).subcategories
                                               
  end
def new
  @category=Category.new
end
  def create
    @category = Category.new(category_params)
  
    if @category.save
      redirect_to admin_subcategorys_url, notice: 'Subcategory was successfully created.'
    else
      render :new1
    end
  end
    private
  
  def category_params
    params.require(:category).permit(:name, :parent_id)
  end
end

