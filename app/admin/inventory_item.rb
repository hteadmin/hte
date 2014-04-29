ActiveAdmin.register InventoryItem do
  menu :priority => 6, :label => proc{ I18n.t("inventory") }
  permit_params :name, :display_name, :serial

  index do
    column :name
    column :display_name
    column :serial
    default_actions
  end


end
