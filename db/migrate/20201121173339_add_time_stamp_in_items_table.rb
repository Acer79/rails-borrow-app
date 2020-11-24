class AddTimeStampInItemsTable < ActiveRecord::Migration[6.0]
  def change
    def change
      add_timestamps :items, null: false, default: -> { "NOW()" }
    end
  end
end
