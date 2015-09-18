class CategoriesController < ApplicationController
  
  before_action :find_category, only:[:edit, :update, :destroy]
 
  
  def index
    @categories = Category.all
  end
  
  def new
    @category = Category.new
  end
  
  def create
    @category = Category.new(category_params)
    if @category.save
    redirect_to categories_path
    else
      render :new
    end
  end
  
  def edit
  end
  
  def update
    if @category.update(category_params)
      redirect_to categories_path
    else
      render :edit
    end
  end
  
  private
  
  def find_category
    @category = Category.find(params[:id])
  end
  
  def category_params
    params.require(:category).permit(:category, :order_number)
  end
  
end
