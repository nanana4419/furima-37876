Rails.application.routes.draw do
  root to: 'items#index'  
  post 'items', to: 'items#create'
end