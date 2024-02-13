Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: "pages#home"

  get '/dashboard', to: 'dashboard#show'
  resources :users, only: [:show] do
    get '/sempais/:id', to: 'users#show', as: 'sempai'
  end

  namespace :sempais do
    get '/bookings', to: 'bookings#index'
    get '/bookings/:id', to: 'bookings#show'
    patch '/bookings/:id', to: 'bookings#update'
  end

  resources :topics, except: [:index, :destroy] do
    resources :bookings, only: [:new, :create]
    get '/sempais', to: 'topics#matching_sempais'
  end

  resources :bookings, only: [:index, :show, :edit, :update] do
    resources :messages, only: [:create]
  end

  resources :users, only: [:show, :edit, :update]
end
