class PagesController < ApplicationController

  def index

  end

  def dich_vu
    set_tab :dich_vu
    @products = Product.includes(:accessories).order('root_id')
    @shippings = Shipping.all
  end

  def chon_game
    set_tab :chon_game
    @product_instances = Instance.includes(:games, :product).group_by(&:product)
    @default_product = @product_instances.keys.first
    if params[:product].present?
      @default_product = Product.find_by_slug(params[:product])
    end
    @default_set = @default_product.instances.first
    if current_cart.primary_item && current_cart.primary_item.instance
      @default_set = current_cart.primary_item.instance
    end
    if params[:set].present?
      @default_set = Instance.find_by_slug(params[:set])
    end
  end

  def chon
    if params[:gameset].present?
      instance = Instance.find(params[:gameset])
      product = instance.product
      current_cart.primary_item.destroy if current_cart.primary_item
      current_cart.create_primary_item(product: product, instance: instance, quantity: 1, price: product.sell_price)
      redirect_to dat_thue_path
    else
      redirect_to chon_game_path, danger: t('error.select_game_first')
    end
  end

  def dat_thue
    set_tab :dat_thue
    return redirect_to chon_game_path, danger: t('error.select_game_first') unless current_cart.primary_item

    @cart = current_cart
    @cart.rental_weeks ||= 1
    @cart.primary_item.product.accessories.each do |accessory|
      @cart.items.build(product: accessory, quantity: 0, price: accessory.sell_price)
    end
  end

  def tao_don_hang
    current_cart.assign_attributes(params.require(:cart).permit!)
    if (order = Order.create_from_cart(current_cart))
      UserMailer.notify_order(order).deliver
      AdminMailer.notify_order(order).deliver
      redirect_to order_path(order.number), success: t('success.order_create_successfully')
    else
      redirect_to dat_thue_path, danger: t('error.cannot_create_order')
    end
  end

  def thue_phu_kien
    set_tab :thue_phu_kien
    @accessories = Product.accessories
    @order = Order.new
    @order.rental_weeks = 1
    @order.delivery_method = Order::DELIVER_AT_HOME
    @order.deposit_type = Order::DEPOSIT_PASSPORT
    @accessories.each do |accessory|
      @order.items.build(name: accessory.name, price: accessory.noc_price, quantity: 0, product: accessory, cost: accessory.cost)
    end
  end

  def dat_thue_phu_kien
    order = Order.new(params.require(:order).permit!)
    order.order_type = Order::THUE_PHU_KIEN
    subtotal = 0
    deposit = 0
    shipping = 0
    order.items.each do |item|
      item.total = order.rental_weeks * item.quantity * item.price
      subtotal += item.total
      deposit += item.cost.to_i * item.quantity
    end
    shipping = order.district.price
    shipping = 0 if order.delivery_method == Order::DELIVER_AT_STORE
    shipping = 0 if subtotal > 500000

    deposit = 0 if order.deposit_type != Order::DEPOSIT_CASH
    order.deposit_amount = deposit
    order.shipping_price = shipping
    order.subtotal = subtotal
    order.total = subtotal + shipping
    if order.save
      UserMailer.notify_order(order).deliver
      AdminMailer.notify_order(order).deliver
      redirect_to order_path(order.number), success: t('success.order_create_successfully')
    else
      redirect_to dat_thue_phu_kien_path, danger: t('error.cannot_create_order')
    end
  end

  def game
    set_tab :chon_game
    @game = Game.find_by_slug(params[:id])
  end

  def search
    order = Order.find_by_number(params[:number])
    if order
      redirect_to order_url(order.number)
    else
      redirect_to root_url, warning: t('error.no_order_found')
    end
  end

  def cau_hoi_thuong_gap
    set_tab :cau_hoi_thuong_gap
  end

  def dat_hang_truoc_ps4
    @pre_order = PreOrder.new
  end

  def gui_dat_hang_ps4
    pre_order = PreOrder.new(params.require(:pre_order).permit!)
    if pre_order.save
      UserMailer.notify_pre_order(pre_order).deliver
      AdminMailer.notify_pre_order(pre_order).deliver
      redirect_to dat_hang_ps4_thanh_cong_url, success: t('success.pre_order_create_successfully')
    else
      redirect_to dat_hang_truoc_ps4_url, danger: t('error.cannot_create_pre_order')
    end
  end

  def dat_hang_ps4_thanh_cong
    render layout: 'simple'
  end

end