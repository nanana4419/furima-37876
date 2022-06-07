Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'  
  post 'items', to: 'items#create'
  resources :items do
     resources :records, only: [:index, :create]
     resources :comments, only: :create
  end
end