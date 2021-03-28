Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'shops#index'
  resources :products
  resources :users, only: [ :show, :edit, :update ]
  resources :prices, except: [ :show ]
  resources :carts, only: [ :show, :destroy ]
  resources :cart_items, only: [ :create, :destroy ] do
    member do
      post 'add_quantity', as: 'cart_item_add'
      post 'reduce_quantity', as: 'cart_item_reduce'
    end
  end
  resources :orders, only: [ :index, :new, :create ]

  namespace :authentication do
    resources :sessions, only: [ :new, :create, :destroy ]
    get 'signup', to: 'sessions#signup'
    post 'register_user', to: 'sessions#register_user'
    delete "logout", to: "sessions#destroy"
  end
end
