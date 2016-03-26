sRails.application.routes.draw do

  devise_for :users, :controllers => { omniauth_callbacks: 'omniauth_callbacks' }

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root to: 'home#index'
  get '/', to: "home#index", as: :index
  get '/', to: "home#home", as: :home

  get '/about', to: "home#about", as: :about
  
end
