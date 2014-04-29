class InventoryItem < ActiveRecord::Base
  validates :name, :display_name, :serial, presence: true
end
