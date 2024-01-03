Rails.application.routes.draw do
  get 'usages/new'
  get 'usages/create'
  get 'usages/edit'
  get 'usages/delete'
  root 'lenses#index'
  get 'session/new'
  resources :users
  resources :lens_types, only: [:index] do
    member do
      get 'select_lens'
    end
  end
  resources :lenses, only: %i[index show] do
    member do
      get 'add_usage'
    end
  end
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :account_activations, only: [:edit]
end
