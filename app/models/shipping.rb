class Shipping < ActiveRecord::Base

  def self.value_hash
    Shipping.all.inject({}) { |h, shipping| h[shipping.id] = shipping.price; h}
  end

  def to_s
    location
  end
end
