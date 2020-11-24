class UsersController < ApplicationController
  def my_page
    @user_items = current_user.items
  end
end
