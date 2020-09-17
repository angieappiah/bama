Rails.application.routes.draw do

  root to: 'application#index'
  resources :styles
  resources :pieces
  resources :designers

  get  '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get  '/logout' => 'sessions#destroy'
  post '/logout' => 'sessions#destroy'

  get  '/auth/facebook/callback' => 'sessions#create'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
