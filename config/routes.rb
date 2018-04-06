Rails.application.routes.draw do
  resources :showcase_images
  resources :user_activities
  resources :shot_list_items
  mount ActionCable.server => '/cable'
  resources :assistants
  resources :user_profiles
  resources :contacts
  resources :schedule_items
  resources :collections do
    resources :collection_items
  end
  resources :locations
  resources :collection_items do
    get '/move_up', to: 'collection_items#move_up', as: 'move_up'
    get '/move_down', to: 'collection_items#move_down', as: 'move_down'
    get '/make_header', to: 'collection_items#make_header', as: 'make_header'
  end
  get '/collection_item/download/:id', to: 'collection_items#download', as:'download'
  resources :waitlists
  get 'waitlist/thank-you', to: 'waitlists#thank_you', as: 'thank_you'

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
    get 'invoice', to: 'proposals#invoice', as: 'invoice'
    get 'wizard', to: 'proposals#wizard', as: 'wizard'
    resources :shot_list_items
  end

  get 'proposal/completed', to: 'proposals#completed', as: 'proposals_completed'
  get 'requests', to: 'proposal_requests#requests', as:'proposal_requests'
  get 'requests/:id/decline', to: 'proposal_requests#decline', as:'decline_proposal_request'
  get 'proposal_requests/:id/send_request_accepted_email', to: 'proposal_requests#send_request_accepted_email'
  get 'proposal_requests/:id/send_request_created_email', to: 'proposal_requests#send_request_created_email'


  post 'charges/deposit/:proposal_id', to: 'charges#proposal_deposit', as: 'proposal_deposit'
  post 'charges/balance/:proposal_id', to: 'charges#proposal_balance', as: 'proposal_balance'


  resources :companies do
    get 'send_welcome_email', to:'companies#send_welcome_email'

  end
  get 'invoices', to:'companies#invoices', as: 'invoices'
  devise_for :users
  get 'user/:id', to: "users#show", as: 'user_show'
  get 'users/:user_id/collections', to: "collections#index", as: 'user_collection'
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
  get 'dashboard/accounting', to: 'dashboards#accounting_dashboard', as: 'accounting_dashboard'
  get 'dashboard/admin', to: 'dashboards#admin_dashboard', as: 'admin_dashboard'
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
  get 'tos', to: 'khaki#tos', as: 'tos'

  get 'admin/users', to: 'admin#users', as: 'admin_users'
  get 'admin/proposals', to: 'admin#proposals', as: 'admin_proposals'
  get 'admin/schedule_items', to: 'admin#schedule_items', as: 'admin_schedule_items'

  #root 'khaki#nomcre_home'
  root 'application#home'

end
