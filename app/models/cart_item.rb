class CartItem < ActiveRecord::Base
  belongs_to :cart
  belongs_to :product
  belongs_to :instance

  def display_name
    str = product.try(:name)
    if instance.present?
      str << " - #{instance.try(:name)}"
    end
    str
  end
end
