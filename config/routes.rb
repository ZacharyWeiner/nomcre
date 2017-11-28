Rails.application.routes.draw do
  mount ActionCable.server => '/cable'
  resources :assistants
  resources :user_profiles
  resources :contacts
  resources :schedule_items
  resources :collections do
    resources :collection_items
  end
  get '/collection_item/download/:id', to: 'collection_items#download', as:'download'
  resources :waitlists

  get 'waitlist/joined_waitlist', to: 'waitlists#send_joined_waitlist_email'
  get 'waitlist/creative_accepted', to: 'waitlists#send_user_accepted_email'



  resources :proposals do
    get '/edit_details', to: 'proposals#edit_details', as: 'edit_details'
    get '/payment', to: 'proposals#payment'
    get 'create_request/:user_id', to: 'proposals#create_request', as: 'create_request'
    get 'accept_request', to: 'proposals#accept_request'
    get 'approve_request', to: 'proposals#approve_request'
    get 'send_email', to: 'proposals#send_email'
    get 'send_assigned_email', to: 'proposals#send_creative_assigned_email'
    get 'copy', to: 'proposals#copy', as: 'copy'
    get 'accepted', to: 'proposals#accepted_requests', as: "accepted_requests"
  end

  get 'proposal/completed', to: 'proposals#completed', as: 'proposals_completed'
  get 'requests', to: 'proposal_requests#requests', as:'proposal_requests'
  get 'proposal_requests/:id/send_request_accepted_email', to: 'proposal_requests#send_request_accepted_email'
  get 'proposal_requests/:id/send_request_created_email', to: 'proposal_requests#send_request_created_email'


  post 'charges/deposit/:proposal_id', to: 'charges#proposal_deposit', as: 'proposal_deposit'
  post 'charges/balance/:proposal_id', to: 'charges#proposal_balance', as: 'proposal_balance'


  resources :companies do
    get 'send_welcome_email', to:'companies#send_welcome_email'
  end
  devise_for :users
  get 'user/:id', to: "users#show", as: 'user_show'
  get 'user_type', to: 'users#user_type', as: 'user_type'
  get 'set_user_type', to:'users#set_user_type', as:'set_user_type'
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
  get 'home', to:'khaki#nomcre_home', as:'nomcre_home'
  get 'process', to:'khaki#nomcre_process', as: 'nomcre_process'
  get 'creative', to:'khaki#creative_landing', as: 'creative_landing'
  get 'showcase', to:'khaki#creative_showcase', as: 'creative_showcase'
  get 'contact', to:'khaki#contact', as: 'nomcre_contact'
  get 'about', to:'khaki#about', as: 'nomcre_about'
  get 'featured', to:'khaki#featured_creatives', as: 'featured_creatives'
  get 'creative_tutorial', to:'khaki#proposal_tutorial_creative', as: 'proposal_tutorial_creative'
  get 'company_tutorial', to:'khaki#proposal_tutorial_company', as: 'proposal_tutorial_company'
  get 'khaki/index', to:'khaki#index'

  #root 'khaki#nomcre_home'
  root 'application#home'

end
