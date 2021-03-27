Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'products#index'

  resources :users

  namespace :authentication do
    resources :sessions, only: [ :new, :create, :destroy ]
    get 'signup', to: 'sessions#signup'
    post 'signup', to: 'sessions#create_user'
    delete "logout", to: "sessions#destroy"
  end


end
