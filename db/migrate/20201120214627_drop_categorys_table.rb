class DropCategorysTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :categorys
  end
end
