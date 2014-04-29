ActiveAdmin.register Blog::Article do
  menu :parent => "Blog", priority: 2
  permit_params :category_id, :title, :slug, :body, :published, :published_at
  form do |f|
    f.inputs "Details" do
      f.input :category
      f.input :title
      f.input :slug
      f.input :body, :as => :redactor
    end
    f.actions
  end

  show do |article|
    attributes_table do
      row :id
      row :category
      row :title
      row :slug
    end
  end

  index do
    # column :number do |order|
    #   link_to order.number, order_path(order.number), target: '_blank'
    # end
    column :category
    column :title
    actions
  end
end