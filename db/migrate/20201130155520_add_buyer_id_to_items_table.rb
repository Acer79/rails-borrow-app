class AddBuyerIdToItemsTable < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :buyer_id, :int
  end
end
