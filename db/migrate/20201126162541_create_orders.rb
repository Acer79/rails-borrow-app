class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.time :order_date
      t.string :status
      t.references :buyer, index: true, null: false, foreign_key: { to_table: :users }
      t.references :seller, index: true, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
