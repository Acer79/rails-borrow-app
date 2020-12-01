class CategoriesController < ApplicationController
  def index
    @category = Category.all
  end

  def new
    @category = Category.new
    @allCat = Category.all
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "Category was created successfully."
      redirect_to my_page_path
    else
      render "new"
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
