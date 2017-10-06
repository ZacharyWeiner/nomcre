Rails.application.routes.draw do
  resources :waitlists
  mount ActionCable.server => '/cable'
  resources :proposals
 # Front routes start
  devise_for :users

  resources :pages
  resources :chatrooms
  resources :messages

  #notifications
  get '/notifications', to: 'notifications#index', as: 'notifications'

  #tasks
  resources :tasks do
    get '/complete', to: 'tasks#complete', as: 'task_complete'
  end

  root 'pages#index'
end
