Rails.application.routes.draw do

  root to: 'application#index'
  resources :styles
  resources :pieces
  resources :designers

  get  '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
  get  '/logout' => 'sessions#destroy'
  

  get  '/auth/facebook/callback' => 'sessions#create'

   resources :styles do
    resources :pieces
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
