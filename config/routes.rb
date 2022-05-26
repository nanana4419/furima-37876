Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'  
  post 'items', to: 'items#create'
  resources :items, only: [:index, :new, :create, :show, :edit, :update]
end