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
  get 'cab_request/:id', to: 'cabs#cab_request', as:'cab_request'
  get 'show_request', to: "driver_requests#show_request"
  get 'customer_request_approve', to: "driver_requests#customer_request_approve"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
              