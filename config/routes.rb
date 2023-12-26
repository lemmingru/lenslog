Rails.application.routes.draw do
  resources :lenses, only: [:show]
  resources :lens_types, only: [:index] do
    member do
      get 'select_lens'
    end
  end
end
