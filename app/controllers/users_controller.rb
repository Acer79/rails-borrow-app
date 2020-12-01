class UsersController < ApplicationController
  def my_page
    @users = User.all
    @seller_items = current_user.seller_orders.map { |so| so.order_items.map { |oi| { item: oi.item } } }.flatten
    x = current_user.seller_orders.map { |so| so.order_items.map { |ord| { order: ord.order } } }.flatten
    @buyer = x.map { |z| z[:order].buyer_id }
    @buyer_items = current_user.buyer_orders.map { |bo| bo.order_items.map { |oi| { item: oi.item } } }.flatten
    t = current_user.buyer_orders.map { |bo| bo.order_items.map { |ord| { order: ord.order } } }.flatten
    @seller = t.map { |r| r[:order].seller_id }
    # render json: buyer_items
  end
end
