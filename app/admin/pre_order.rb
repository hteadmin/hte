ActiveAdmin.register PreOrder do
  menu :priority => 8

  index do
    column :client_name
    column :phone
    column :street do |pre_order|
      pre_order.address
    end
    column :games do |pre_order|
      pre_order.games.join("<br/>").html_safe
    end
  end

end
