Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  resources :books, path: "books" do
    collection do
      get :newest
      get :price_asc
      get :price_desc
    end
  end
  resources :books, only: [:index, :show]
  resources :categories, only: [:index, :show]
  resources :order_items, only: [:index, :update, :destroy]
  resources :orders, only: [:index, :create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'dashboard#index'
end
