class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
    @categories = Category.all
  end

  def create
    @item = Item.new(article_params)
    if @item.save
      order = Order.create(seller_id: current_user.id, buyer_id: @item.buyer_id)
      order_item = OrderItem.create(order_id: order.id, item_id: @item.id)
      flash[:notice] = "Item was created successfully."
      redirect_to my_page_path
    else
      render "new"
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(article_params)
      order = Order.update(buyer_id: @item.buyer_id)
      flash[:notice] = "Item was updated successfully."
      redirect_to my_page_path
    else
      render "edit"
    end
  end

  def show
  end

  def destroy
    item = Item.find(params[:id])
    order_item = OrderItem.where(item_id: item.id).first
    order = Order.where(id: order_item.id).first
    item.destroy
    order_item.destroy
    order.destroy
    flash[:notice] = "#{item.name} was successfully removed from your portfolio"
    redirect_to my_page_path
  end

  private

  def article_params
    params.require(:item).permit(:name, :description, :category_id, :buyer_id)
  end
end
