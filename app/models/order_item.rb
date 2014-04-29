class OrderItem < ActiveRecord::Base
  belongs_to :order

  has_many :contract_items, dependent: :destroy
  has_many :inventory_items, through: :contract_items

  accepts_nested_attributes_for :inventory_items

  attr_accessor :product, :cost
end
