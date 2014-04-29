Rails.application.routes.draw do
  root 'pages#index'
  get 'dich_vu' => 'pages#dich_vu', as: :dich_vu
  get 'game/:id' => 'pages#game', as: :game
  get 'chon_game' => 'pages#chon_game', as: :chon_game
  post 'chon_game' => 'pages#chon'
  get 'thue_phu_kien' => 'pages#thue_phu_kien', as: :thue_phu_kien
  post 'thue_phu_kien' => 'pages#dat_thue_phu_kien'
  get 'dat_thue' => 'pages#dat_thue', as: :dat_thue
  post 'dat_thue' => 'pages#tao_don_hang'
  post 'search' => 'pages#search', as: :search

  resources :orders, path: 'don-hang', only: [:show] do
    member do
      get 'hop_dong' => 'orders#hop_dong'
    end
  end

  scope '/blog' do
    get '', to: 'blog#index', as: :blog
    get '/:year/:month', to: 'blog#archive', constraints: { year: /20\d{2}/, month: /[01]?\d/ }, as: :blog_archive
    get '/:year/:month/:slug', to: 'blog#article', constraints: { year: /20\d{2}/, month: /[01]?\d/ }, as: :blog_article
    get '/chuyen-muc/:slug', to: 'blog#category', as: :blog_category
  end

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
