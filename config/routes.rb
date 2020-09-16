Rails.application.routes.draw do
  resources :styles
  resources :pieces
  resources :designers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
