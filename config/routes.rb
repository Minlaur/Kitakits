Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: "pages#home"

  get '/dashboard', to: 'dashboard#show'

  get '/sempais/:id', to: 'users#show', as: 'sempai'

  devise_scope :user do
    # the edit and patch will be used for the last_seen attribute change connected to the online_indicator_controller.js
    get 'users/:id/edit', to: 'users#edit', as: 'edit_user'
    patch 'users/:id' => 'users#update', as: 'update_user'
  end

  namespace :sempais do
    resources :users, only: [] do
      resources :bookings, only: [:index, :show, :update]
    end
  end

  resources :users do
    resources :reviews, only: [:new, :create, :index]
    resources :topics, only: [:index, :show]
  end

  resources :topics, except: [:index, :destroy] do
    member do
      patch :resolved
      patch :cancelled
    end
    resources :bookings, only: [:new, :create, :show] do
      resources :messages, only: [:index, :create] # Add this line
    end
    post '/sempais/:id', to: 'bookings#create', as: 'create_booking_chat'
    get '/sempais', to: 'topics#matching_sempais'
  end

  resources :bookings, only: [:index, :edit, :update]

  resources :bookings, only: [:show]do
    member do
      patch 'accepted'
      patch 'rejected'
    end
    resources :messages, only: [:index, :create, :show]
  end


end
