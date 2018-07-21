Rails.application.routes.draw do
  resources :books, only: [:index, :show]
  resources :order_items, only: [:index, :update, :destroy]
  resources :orders, only: [:index, :create ]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
