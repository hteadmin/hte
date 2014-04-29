ActiveAdmin.register Game do
  menu :priority => 2
  permit_params :name, :slug, :description, :trailer, :photo

  index do
    column :name
    column :slug
    default_actions
  end

  form do |f|
    f.inputs "Game Detail" do
      f.input :name
      f.input :slug
      f.input :description, :required => false
      f.input :trailer, :required => false
      f.input :photo, :required => false, :as => :file
    end
    f.actions
  end

  show do |game|
    attributes_table do
      row :name
      row :slug
      row :description do
        simple_format game.description
      end
      row :trailer
      row :photo do
        image_tag(game.photo.url(:thumb))
      end
    end
  end
end
