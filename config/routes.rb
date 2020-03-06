Rails.application.routes.draw do
  resources :users
  get '/', to: 'application#home'
end
