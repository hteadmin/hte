ActiveAdmin.register Blog::Category do
  menu :parent => "Blog", priority: 1
  permit_params :name, :slug
end