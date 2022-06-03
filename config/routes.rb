Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'  
  post 'items', to: 'items#create'
  resources :items do #only: [:index, :new, :create, :show, :edit, :update, :destroy]
     resources :records, only: [:index, :create]
  end
end