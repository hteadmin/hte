class ApplicationController < ActionController::Base
  helper :all
  add_flash_types :danger
  add_flash_types :warning
  add_flash_types :info

  protect_from_forgery with: :exception

  def current_cart
    if session[:cart_id]
      @current_cart ||= Cart.find(session[:cart_id])
      session[:cart_id] = nil if @current_cart.purchased_at
    end
    if session[:cart_id].nil?
      @current_cart = Cart.create!
      session[:cart_id] = @current_cart.id
    end
    @current_cart
  end
end
