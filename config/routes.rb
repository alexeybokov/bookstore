Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations'
  }
  resources :books, path: "books" do
    collection do
      get :newest
      get :price_asc
      get :price_desc
      get :name_a_to_z
      get :name_z_to_a
    end
  end

    resources :books, only: :show do
      resources :reviews, only: :create
    end

  resources :categories, only: [:index, :show]
  resources :order_items, only: [:index, :create, :update, :destroy]
  resources :orders, only: [:index, :create, :destroy]
  resources :checkout
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'dashboard#index'
end
