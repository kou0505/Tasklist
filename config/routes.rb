Rails.application.routes.draw do
  root to: 'tasks#index'

  get 'login', to: 'sessions#new' #to read info of sessions
  post 'login', to: 'sessions#create' #to crate info of sessions
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  resources :tasks
  resources :users, only: [:new, :create]
end
