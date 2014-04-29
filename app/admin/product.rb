ActiveAdmin.register Product do
  menu :priority => 1
  permit_params :name, :slug, :price, :sale_price, :noc_price, :cost, :unit, :description, :photo, :active, :root_id

  form do |f|
    f.inputs "Product Detail" do
      f.input :root
      f.input :name
      f.input :slug
      f.input :price
      f.input :sale_price
      f.input :noc_price
      f.input :cost
      f.input :unit
      f.input :description, :required => false
      f.input :photo, :required => false, :as => :file
      f.input :active
    end
    f.actions
  end

  show do |product|
    attributes_table do
      row :name
      row :slug
      row :price do
        number_to_currency product.price
      end
      row :sale_price do
        number_to_currency product.sale_price
      end
      row :noc_price do
        number_to_currency product.noc_price
      end
      row :cost do
        number_to_currency product.cost
      end
      row :unit
      row :description
      row :photo do
        image_tag(product.photo.url(:thumb))
      end
      row :active do
        product.active? ? status_tag( "yes", :ok ) : status_tag( "no" )
      end
    end
  end

  index do
    column :id
    column :name
    column :slug
    column :price do |product|
      "%s / %s" % [number_to_currency(product.price), I18n.t('tuan')]
    end
    column :sale_price do |product|
      "%s / %s" % [number_to_currency(product.sale_price), I18n.t('tuan')] if product.sale_price
    end
    column :noc_price do |product|
      "%s / %s" % [number_to_currency(product.noc_price), I18n.t('tuan')] if product.noc_price
    end
    actions
  end
end
