Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: "page#home"

  get '/dashboard', to: 'dashboard#show'

  get '/sempais/:id', to: 'users#show'

  namespace :sempais do
    get '/bookings', to: 'sempais/bookings#index'
    get '/bookings/:id', to: 'sempais/bookings#show'
    patch '/bookings/:id', to: 'sempais/bookings#update'

  end

  resources :topics, except: [:index, :destroy] do
    resources :bookings, only: [:new, :create]
  end

  resources :bookings, only: [:index, :show, :edit, :update] do
    resources :messages, only: [:create]
  end
end
