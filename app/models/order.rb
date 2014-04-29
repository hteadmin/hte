class Order < ActiveRecord::Base
  belongs_to :district, class_name: 'Shipping', foreign_key: 'district_id'
  has_many :items, class_name: 'OrderItem', dependent: :destroy
  accepts_nested_attributes_for :items, reject_if: lambda { |item| item[:quantity].to_i <= 0 }, allow_destroy: true
  before_create :generate_number

  DELIVER_AT_HOME = 'at_home'
  DELIVER_AT_STORE = 'at_store'

  DEPOSIT_PASSPORT = 'passport'
  DEPOSIT_PERSON_ID = 'cmnd'
  DEPOSIT_CASH = 'cash'

  THUE_MAY = 'thue_may'
  THUE_PHU_KIEN = 'thue_phu_kien'

  def self.create_from_cart(cart)
    begin
      transaction do
        order = Order.new
        order.order_type = Order::THUE_MAY
        order.client_name = cart.client_name
        order.phone = cart.phone
        order.email = cart.email
        order.street = cart.street
        order.district = cart.district
        order.rental_weeks = cart.rental_weeks
        order.note = cart.note

        subtotal = 0
        cart.items.each do |item|
          itemtotal = item.quantity * item.price * order.rental_weeks
          order.items.build(name: item.display_name, quantity: item.quantity, price: item.price, total: itemtotal)
          subtotal += itemtotal
        end
        order.shipping_price = cart.district.price
        order.shipping_price = 0 if subtotal > 500000
        order.subtotal = subtotal
        order.total = subtotal + order.shipping_price
        order.save!
        cart.purchased_at = Time.now
        cart.save!
        return order
      end
    rescue Exception => e
      puts e.message
      puts e.backtrace
      return nil
    end
  end

  def address
    "%s, %s, TP.HCM" % [street, district]
  end

  private

    def generate_number
      padding = 5
      last_order = Order.last
      last_number = last_order ? last_order.number.to_i : 11200
      new_number = last_number + 1
      if new_number > 99999
        # adjust padding
        padding = new_number.to_s.size
      end
      self.number = ("%0#{padding}d" % (new_number))
    end
end
