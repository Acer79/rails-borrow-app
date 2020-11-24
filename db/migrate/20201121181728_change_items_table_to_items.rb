class ChangeItemsTableToItems < ActiveRecord::Migration[6.0]
  def change
    rename_table :items_tables, :items
  end
end
