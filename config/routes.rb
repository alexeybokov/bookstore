Rails.application.routes.draw do
  devise_for :users
  resources :books, only: [:index, :show]
  resources :order_items, only: [:index, :update, :destroy]
  resources :orders, only: [:index, :create ]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'books#index'
  get 'users/profile'
  get 'persons/profile', as: 'user_root'
end
