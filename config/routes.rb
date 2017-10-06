Rails.application.routes.draw do
  resources :companies
  devise_for :users
  resources :pages



  #notifications
  get '/notifications', to: 'notifications#index', as: 'notifications'

  root 'pages#index'
end
