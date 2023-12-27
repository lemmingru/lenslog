Rails.application.routes.draw do
  root 'lenses#show'
  get 'session/new'
  resources :lenses, only: [:show]
  resources :users
  resources :lens_types, only: [:index] do
    member do
      get 'select_lens'
    end
  end
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
