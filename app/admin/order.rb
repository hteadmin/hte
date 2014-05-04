ActiveAdmin.register Order do
  menu :priority => 4

  controller do
    def permitted_params
        params.permit!
    end
  end

  form do |f|
    f.inputs "Client" do
      f.input :number, input_html: {disabled: true}
      f.input :client_name
      f.input :phone
      f.input :email
      f.input :street
      f.input :district
    end
    f.inputs "Pricing" do
      f.input :delivery_method, as: :select, collection: Hash[[[t(Order::DELIVER_AT_HOME), Order::DELIVER_AT_HOME], [t(Order::DELIVER_AT_STORE), Order::DELIVER_AT_STORE]]]
      f.input :deposit_type, as: :select, collection: Hash[[[t(Order::DEPOSIT_PASSPORT), Order::DEPOSIT_PASSPORT], [t(Order::DEPOSIT_PERSON_ID), Order::DEPOSIT_PERSON_ID], [t(Order::DEPOSIT_CASH), Order::DEPOSIT_CASH]]]
      f.input :deposit_amount
      f.input :rental_weeks
      f.input :shipping_price
      f.input :subtotal
      f.input :total
    end
    f.inputs "Management" do
      f.input :state, as: :select, collection: Hash[[[t('pending'), 'pending'], [t('delivered'), 'delivered'], [t('completed'), 'completed'], [t('cancelled'), 'cancelled']]], include_blank: false
      f.input :delivered_at, :as => :datepicker
      f.input :completed_at, :as => :datepicker
      f.input :note
    end

    f.has_many :items, :allow_destroy => true, :heading => 'Items' do |cf|
      cf.input :name
      cf.input :quantity
      cf.input :price
      cf.input :total
      cf.input :inventory_items, :collection => InventoryItem.all.map {|inventory| [inventory.name, inventory.id]}
      # cf.has_many :inventory_items do |ff|
      #   ff.input :inventory_item, :collection => InventoryItem.all.map {|inventory| [inventory.name, inventory.id]}
      # end
    end
    f.actions
  end

  index do
    column :number do |order|
      link_to order.number, order_path(order.number), target: '_blank'
    end
    column :client_name
    column :phone
    column :street do |order|
      order.address
    end
    column :completed_at do |order|
      order.completed_at.present? ? order.completed_at.strftime('%d / %m / %Y') : '---'
    end
    column :status do |order|
      case order.state
      when 'pending'
        status_tag( t("pending"), :warning )
      when 'completed'
        status_tag( t("completed"), :ok )
      when 'delivered'
        status_tag( t("delivered"), :yes )
      else
        status_tag( t("cancelled"), :error )
      end
    end
    actions
  end

  show :title => :number do |inc|
    attributes_table do
      row :number do
        link_to inc.number, order_path(inc.number), target: '_blank'
      end
      row :client_name
      row :phone
      row :email
      row :address do
        "%s, %s, TP.HCM" % [inc.street, inc.district]
      end
      row :rental_weeks do
        "%d %s" % [inc.rental_weeks, t('tuan')]
      end
      row :delivery_method do
        t(inc.delivery_method) if inc.delivery_method.present?
      end
      row :deposit_type do
        t(inc.deposit_type)  if inc.deposit_type.present?
      end
      row :deposit_amount do
        number_to_currency inc.deposit_amount
      end
      row :shipping_price do
        number_to_currency inc.shipping_price
      end
      row :subtotal do
        number_to_currency inc.subtotal
      end
      row :total do
        number_to_currency inc.total
      end
      row :state do
        status_tag(t(inc.state), :ok)
      end
      row :delivered_at
      row :completed_at
      row :note
      h3 OrderItem.model_name.human
      table_for inc.items do
        column :name
        column :quantity
        column :price do |item|
          number_to_currency(item.price)
        end
        column :total do |item|
          number_to_currency(item.total)
        end
      end
    end
  end

end
