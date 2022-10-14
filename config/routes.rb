Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :driver_requests
  get 'welcomes/index'
  devise_for :users
  root to: "welcomes#index"
  resources :customers
  resources :cabs
  get "loged_in_driver_cabs", to: "cabs#loged_in_driver_cab"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
 