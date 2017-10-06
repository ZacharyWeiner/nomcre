Rails.application.routes.draw do

  resources :schedule_items
  resources :collection_items
  resources :collections
  resources :waitlists
  mount ActionCable.server => '/cable'

  resources :proposals do
    get '/edit_details', to: 'proposals#edit_details', as: 'edit_details'
    get '/payment', to: 'proposals#payment'
    get 'create_request/:user_id', to: 'proposals#create_request', as: 'create_request'
    get 'accept_request', to: 'proposals#accept_request'
    get 'approve_request', to: 'proposals#approve_request'
  end
  get 'proposal/completed', to: 'proposals#completed', as: 'proposals_completed'
  get 'requests', to: 'proposal_requests#requests', as:'proposal_requests'


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

  #dashboards
  get '/dashboard/company', to: 'dashboards#company_dashboard', as: 'company_dashboard'
  get 'dashboard/creative', to: 'dashboards#creative_dashboard', as: 'creative_dashboard'

  root 'application#home'
end
