class AddInventoryItemToOrderItems < ActiveRecord::Migration
  def change
    add_column :order_items, :inventory_item_id, :integer
  end
end
