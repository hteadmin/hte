class RemoveInventoryFromItem < ActiveRecord::Migration
  def change
    remove_column :order_items, :inventory_item_id
  end
end
