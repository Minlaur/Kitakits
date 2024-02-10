Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: "page#home"

  namespace :sempais do
    get '/sempais', to: 'sempais#index'
    get '/sempais/:id', to: 'sempais#show'
    get '/dashboard', to: 'sempais#dashboard'
    get '/bookings', to: 'sempais#bookings'
    get '/bookings/:id', to: 'sempais#booking'
  end

  resources :topics, except: [:index, :destroy] do
    resources :bookings, only: [:new, :create]
  end

  resources :bookings, only: [:show, :edit, :update]

end
