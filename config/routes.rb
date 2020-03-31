Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  resources :tickets
  resources :help_desks do
    resources :tickets, shallow: true
  end
  resources :comments, only: [:create]
  resources :organizations do
    resources :help_desks, shallow: true
  end
  root to: 'user_sessions#new'

  resources :user_sessions, only: [:create]
  resources :users

  get 'login' => 'user_sessions#new', :as => :login
  post 'logout' => 'user_sessions#destroy', :as => :logout
end
