Rails.application.routes.draw do
  get 'pages/home'
  get 'topics/create'
  get 'topics/edit'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: "home#index"

  # resources :tags do
  #   resources :topics, only: [:index]
  # end
  namespace :sempais do
    get '/sempais', to: 'sempais#index'
    get '/sempais/:id', to: 'sempais#show', as: 'sempai'
  end

  resources :topics, except: [:index, :destroy] do
    resources :bookings, only: [:new, :create]
  end

  resources :bookings, only: [:show, :edit, :update,]

end
