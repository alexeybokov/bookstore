Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  resources :books, only: [:index, :show]
  resources :order_items, only: [:index, :update, :destroy]
  resources :orders, only: [:index, :create ]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'dashboard#index'
end
