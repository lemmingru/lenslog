Rails.application.routes.draw do
  root 'lenses#index'
  get 'session/new'
  resources :users
  resources :lens_types, only: %i[index new create] do
    member do
      get 'select_lens'
    end
  end
  resources :lenses, only: %i[index show destroy] do
    member do
      get 'add_usage'
      get 'delete_usage'
      get 'change'
    end
  end
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :account_activations, only: [:edit]

end
