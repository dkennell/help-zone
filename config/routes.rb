Rails.application.routes.draw do
  resources :help_desks
  resources :organizations do
    resources :help_desks, shallow: true
  end
  root to: 'user_sessions#new'

  resources :user_sessions, only: [:create]
  resources :users

  get 'login' => 'user_sessions#new', :as => :login
  post 'logout' => 'user_sessions#destroy', :as => :logout
end
