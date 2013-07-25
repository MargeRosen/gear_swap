class CategoriesController < ApplicationController
  def index

  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(params[:category])
    if @category.save
      flash[:notice] = "Category has been created."
      redirect_to @category
    else
      #nothing for now
    end
  end

  def show
    @category = Category.find(params[:id])
  end

end
