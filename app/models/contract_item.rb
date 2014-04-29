class ContractItem < ActiveRecord::Base
  belongs_to :order_item
  belongs_to :inventory_item
end
