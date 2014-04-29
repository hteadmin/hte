class Cart < ActiveRecord::Base
  has_many :items, class_name: 'CartItem'
  has_one :primary_item, -> { where primary: true }, class_name: 'CartItem', dependent: :destroy
  has_many :secondary_items, -> { where primary: false }, class_name: 'CartItem', dependent: :destroy
  belongs_to :district, class_name: 'Shipping', foreign_key: 'district_id'
  accepts_nested_attributes_for :items, reject_if: lambda { |item| item[:quantity].to_i <= 0 }
end
