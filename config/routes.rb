Rails.application.routes.draw do

  resources :collection_items
  resources :collections
  resources :waitlists
  mount ActionCable.server => '/cable'
  resources :proposals
 # Front routes start
  resources :companies
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

  root 'application#home'
end
