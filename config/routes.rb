Rails.application.routes.draw do

  devise_for :users, :controllers => { omniauth_callbacks: 'omniauth_callbacks' }

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root to: 'home#index'
  get '/', to: "home#index", as: :index
  get '/', to: "home#home", as: :home

  get 'university/:id', to: "catalog#university_show", as: :uni_show

  scope '/university/:id/' do
    get 'speciality/:s_id', to: "catalog#speciality", as: :speciality
  end

  scope '/university/:id/speciality/:s_id/' do
    get 'show_folder/:f_id', to: "catalog#show_folder", as: :show_folder
    match 'show_folder/:f_id' => "catalog#create_file", :via => :post
  end

  get '/about', to: "home#about", as: :about
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
