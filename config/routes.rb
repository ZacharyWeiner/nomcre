Rails.application.routes.draw do
  devise_for :users
  resources :pages

  #notifications
  get '/notifications', to: 'notifications#index', as: 'notifications'

  #tasks
  resources :tasks do
    get '/complete', to: 'tasks#complete', as: 'task_complete'
  end

  root 'pages#index'
end
