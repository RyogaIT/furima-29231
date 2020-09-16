Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items
  get 'items/:id', to: 'items#fee'
  resources :orders, only:[:create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
