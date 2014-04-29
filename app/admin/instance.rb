ActiveAdmin.register Instance do
  menu :priority => 3
  permit_params :product_id, :name, :slug, :available, :game_ids => []

  index do
    column :product
    column :name
    column :slug
    column :available
    default_actions
  end

  form do |f|
    f.inputs "Instance Detail" do
      f.input :product
      f.input :name
      f.input :slug
      f.input :available
      f.input :games, :as => :check_boxes
    end
    f.actions
  end

  show do |inc|
    attributes_table do
      row :product
      row :name
      row :slug
      row :available do
        inc.available? ? status_tag( "yes", :ok ) : status_tag( "no" )
      end
      table_for inc.games do
        column "Games" do |game|
          link_to game.name, [ :admin, game ]
        end
      end
    end
  end
end
