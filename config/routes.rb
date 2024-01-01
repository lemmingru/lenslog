Rails.application.routes.draw do
  root 'lenses#index'
  get 'session/new'
  resources :users
  resources :lens_types, only: [:index] do
    member do
      get 'select_lens'
    end
  end
  get '/lens', to: 'lenses#index'
  get '/lens/:id', to: 'lenses#show'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :account_activations, only: [:edit]
end
