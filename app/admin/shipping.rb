ActiveAdmin.register Shipping do
  menu :priority => 5
  permit_params :location, :price

  index do
    column :location
    column :price do |shipping|
      number_to_currency shipping.price
    end
    default_actions
  end
end
