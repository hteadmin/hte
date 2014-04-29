# encoding: UTF-8
class CreateInventoryItems < ActiveRecord::Migration

  def migrate(direction)
    super
    if direction == :up
      InventoryItem.create!(name: "Tay Cầm 1", display_name: "Tay Cầm" , serial: "K033031902396")
      InventoryItem.create!(name: "Tay Cầm 2", display_name: "Tay Cầm" , serial: "E133013500372")
      InventoryItem.create!(name: "Tay Cầm 3", display_name: "Tay Cầm" , serial: "C053012600486")
      InventoryItem.create!(name: "Tay Cầm 4", display_name: "Tay Cầm" , serial: "C322110802423")
      InventoryItem.create!(name: "Tay Cầm 5", display_name: "Tay Cầm" , serial: "C052123802178")
      InventoryItem.create!(name: "Tay Cầm 6", display_name: "Tay Cầm" , serial: "K033030801642")
      InventoryItem.create!(name: "Tay Cầm 7", display_name: "Tay Cầm" , serial: "3032044900663")
      InventoryItem.create!(name: "Tay Cầm 8", display_name: "Tay Cầm" , serial: "0662060900317")
      InventoryItem.create!(name: "Tay Cầm 9", display_name: "Tay Cầm" , serial: "3032042701063")
      InventoryItem.create!(name: "Tay Cầm 10", display_name: "Tay Cầm" , serial: "C322121302471")
      InventoryItem.create!(name: "Tay Cầm 11", display_name: "Tay Cầm" , serial: "C052123500324")
      InventoryItem.create!(name: "Tay Cầm 12", display_name: "Tay Cầm" , serial: "K033031902398")
      InventoryItem.create!(name: "Tay Cầm Move 1", display_name: "Tay Cầm Move" , serial: "751051001774")
      InventoryItem.create!(name: "Tay Cầm Navigator 1", display_name: "Tay Cầm Navigator" , serial: "531030205850")
      InventoryItem.create!(name: "Camera Move 1", display_name: "Camera Move" , serial: "B10004169")
    end
  end

  def change
    create_table :inventory_items do |t|
      t.string :name
      t.string :display_name
      t.string :serial

      t.timestamps
    end
  end
end
