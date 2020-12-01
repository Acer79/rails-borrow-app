class DropFriendshipAndUserItemTables < ActiveRecord::Migration[6.0]
  def change
    drop_table :friendships
    drop_table :user_items
  end
end
