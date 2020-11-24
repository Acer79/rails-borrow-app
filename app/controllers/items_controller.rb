class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
    @categories = Category.all
  end

  def create
    @item = Item.new(params.require(:item).permit(:name, :description, :category_id))
    if @item.save
      @item.users << current_user
      flash[:notice] = "Item was created successfully."
      redirect_to my_page_path
    else
      render "new"
    end
  end

  def show
    @item = Item.find(params[:id])
  end
end
