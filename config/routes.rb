Rails.application.routes.draw do



  resources :email_templates do
    resources :emails do
      resources :email_details
    end
  end
  get 'magic', to: 'headline_adlibs#magic', as: 'headline_adlibs_magic'
  resources :headline_adlibs do
    get 'personalization', to: 'headline_adlibs#personalization', as: 'headline_adlibs_personalization'

  end
  resources :feed_items
  get 'showcase', to:'khaki#creative_showcase', as: 'creative_showcase'
  get 'video_showcase', to:'khaki#video_showcase', as: 'video_showcase'
  get 'video-showcase', to:'khaki#video_showcase', as: 'video_showcase_hyphen'
  get 'videos', to:'khaki#video_showcase', as: 'video_showcase_naked'
  get 'model_showcase', to:'khaki#model_showcase', as: 'model_showcase'
  get 'playground', to: 'khaki#playground', as: 'playground'
  get 'continual_content', to: 'khaki#continual_content', as: 'continual_content'
  get 'stealth-mode', to: 'khaki#continual_content', as: 'stealth_continual_content'
  get 'continual-content', to: 'khaki#continual_content', as: 'h_continual_content'

  resources :shot_list_item_templates
  resources :task_groups do
    get 'add_to_shoot/:shoot_id', to: 'task_groups#copy_group_to_shoot', as:'copy_to_shoot'
    resources :shot_list_item_templates do
      get 'copy', to: 'shot_list_item_templates#copy', as: 'copy'
    end
  end
  get '/package/models', to:'package_types#models', as: 'package_types_models'
  get 'packages/:slug', to: 'package_types#show', as:'package_types_slug'
  resources :creative_requests
  resources :discount_codes
  resources :shoots do
    resources :shot_list_items
    resources :creative_requests
    resources :disclosures
    get '/tasks_popped', to: 'tasks#popped_out', as: 'tasks_poppedout'
    get 'task_groups/edit_names', to: 'task_groups#edit_names', as: 'edit_names'
    post 'task_groups/update_names', to: 'task_groups#update_names', as: 'update_names'
    resources :tasks
    get '/new_request/:user_id', to: 'shoots#create_creative_request', as: 'create_creative_request'
    get 'request_all', to:'shoots#request_all_available_creatives', as: 'request_all'
    get 'assign_creative/:creative_id', to: 'shoots#assign_creative', as: 'assign_creative'
    get 'assign_from_request/:creative_request_id', to: 'shoots#assign_from_request', as: 'assign_from_request'
  end
  resources :creative_requests do
    get 'accept', to:'creative_requests#accept', as: 'accept'
    get 'decline', to:'creative_requests#decline', as: 'decline'
  end
  resources :payments
  resources :projects do
    get 'payment', to: 'projects#payment', as: 'payment'
    get 'wizard', to: 'projects#wizard', as: 'wizard'
    patch 'update_price', to:'projects#update_price', as: 'update_price'
    resources :invoices
    resources :shoots
  end

  resources :documents
  get 'hello_world', to: 'hello_world#index'
  resources :package_types do
    get 'new-from-template', to:'package_types#new_from_template', as:'new_project_from_template'
  end
  get '/pages/Entrepreneur-Magazine', to: 'landing_pages#marketing', as: 'entrepreneur_marketing'
  get '/pages/linkedin-questionnaire', to: 'landing_pages#linkedin', as: 'linkedin'
  get '/headshots', to: 'landing_pages#headshots', as: 'headshots'
  resources :header_images
  resources :lead_notes

  resources :leads do
    resources :lead_notes
  end
  resources :showcase_videos do
    get '/play', to: 'showcase_videos#play', as: 'play'
    get '/play-vertical', to: 'showcase_videos#play_vertical', as: 'play_vertical'
  end
  resources :showcase_images
  resources :user_activities
  resources :shot_list_items
  mount ActionCable.server => '/cable'
  resources :assistants
  resources :user_profiles do
    get 'wizard', to: 'user_profiles#wizard', as:'wizard'
  end
  resources :contacts
  resources :schedule_items
  resources :collections do
    resources :collection_items
    get '/feature', to: 'collections#make_featured', as: 'make_featured'
    get '/remove_feature', to: 'collections#remove_featured', as: 'remove_featured'
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
    resources :assistants
    resources :shot_list_items
  end

  get 'proposal/completed', to: 'proposals#completed', as: 'proposals_completed'
  get 'requests', to: 'proposal_requests#requests', as:'proposal_requests'
  get 'requests/:id/decline', to: 'proposal_requests#decline', as:'decline_proposal_request'
  get 'requests/:id/approve', to: 'proposal_requests#assign', as: 'assign_proposal'
  get 'proposal_requests/:id/send_request_accepted_email', to: 'proposal_requests#send_request_accepted_email'
  get 'proposal_requests/:id/send_request_created_email', to: 'proposal_requests#send_request_created_email'


  post 'charges/deposit/:proposal_id', to: 'charges#proposal_deposit', as: 'proposal_deposit'
  post 'charges/balance/:proposal_id', to: 'charges#proposal_balance', as: 'proposal_balance'
  post 'charges/use-it-deposit', to:'charges#create', as: 'charge_deposit'


  resources :companies do
    get 'send_welcome_email', to:'companies#send_welcome_email'

  end
  resources :invoices do
    post 'pay_with_stripe', to: 'invoices#pay_with_stripe', as: 'pay_with_stripe'
    resources :payments
  end
  #get 'invoices', to:'companies#invoices', as: 'invoices'
  devise_for :users
  get 'user/:id', to: "users#show", as: 'user_show'
  get 'users/:user_id/collections', to: "collections#index", as: 'user_collection'
  get 'user_type', to: 'users#user_type', as: 'user_type'
  get 'set_user_type', to:'users#set_user_type', as:'set_user_type'
  resources :pages do
    get '/publish', to: 'pages#publish', as:'publish'
    resources :page_sections
  end
  resources :page_sections
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

  get 'contact', to:'khaki#contact', as: 'nomcre_contact'
  get 'about', to:'khaki#about', as: 'nomcre_about'
  get 'featured', to:'khaki#featured_creatives', as: 'featured_creatives'
  get 'creative_tutorial', to:'khaki#proposal_tutorial_creative', as: 'proposal_tutorial_creative'
  get 'company_tutorial', to:'khaki#proposal_tutorial_company', as: 'proposal_tutorial_company'
  get 'khaki/index', to:'khaki#index'
  get 'tos', to: 'khaki#tos', as: 'tos'
  get 'thew', to: 'khaki#thew', as:'thew'
  get 'THEW', to: 'khaki#thew', as:'THEW'
  get 'explainer', to: 'khaki#explainer', as:'explainer'
  get 'pricing', to: 'khaki#pricing', as:'pricing'

  get 'admin/users', to: 'admin#users', as: 'admin_users'
  get 'admin/projects', to: 'admin#projects', as: 'admin_projects'
  get 'admin/projects/new', to: 'admin#new_project', as: 'admin_new_project'
  get 'admin/project/:project_id/edit', to: 'admin#edit_project', as: 'admin_edit_project'
  get 'admin/project/:project_id/edit_price', to: 'admin#edit_project_price', as: 'admin_edit_project_price'
  get 'admin/shoots', to: 'admin#shoots', as: 'admin_shoots'
  get 'admin/shoot/:shoot_id/edit', to: 'admin#edit_shoot', as: 'admin_edit_shoot'
  get 'admin/proposals', to: 'admin#proposals', as: 'admin_proposals'
  get 'admin/schedule_items', to: 'admin#schedule_items', as: 'admin_schedule_items'
  get 'admin/collections', to: 'admin#collections', as: 'admin_collections'
  get 'admin/chats', to: 'admin#chatrooms', as: 'admin_chatrooms'
  get 'admin/black_dashboard', to: 'admin#black_dashboard', as: 'admin_black_dashboard'
  get 'admin/proposal_price/:proposal_id', to: 'admin#proposal_price', as: 'admin_proposal_price'
  get 'admin/deposit_paid/:proposal_id', to: 'admin#proposal_mark_deposit_paid', as: 'admin_proposal_mark_deposit_paid'
  get 'admin/balance_paid/:proposal_id', to: 'admin#proposal_mark_balance_paid', as: 'admin_proposal_mark_balance_paid'
  get 'admin/leads', to: 'admin#leads', as: 'admin_leads'
  post 'admin/leads/import', to: 'leads#import', as: 'import_leads'
  get 'admin/task_groups', to: 'admin#task_groups', as: 'admin_task_groups'
  get 'admin/task_group/:id/edit', to: 'admin#edit_task_group', as: 'admin_edit_task_group'
  get '/sales_materials', to: 'khaki#sales_materials', as: 'sales_materials'
  get '/faq', to: 'khaki#faq', as: 'faq'
  get '/landing_marketing', to: 'landing_pages#marketing', as: 'landing_marketing'
  get '/name-your-deposit', to: 'landing_pages#use_it_or_lose_it', as: 'use_it_or_lose_it'
  get '/thank_you', to: 'landing_pages#thank_you', as: 'landing_thank_you'
  get '/for/sales', to: 'pages#sales', as:'for_sales'
  get '/for/marketing', to: 'pages#marketing', as:'for_marketing'
  get '/for/non_profits', to: 'pages#non_profits', as:'for_non_profits'
  get '/for/start_ups', to: 'pages#start_ups', as:'for_start_ups'
  get '/for/consultants', to: 'pages#consultants', as:'for_consultants'
  get '/for/franchises', to: 'pages#franchises', as:'for_franchises'
  get '/sitemap', to: 'pages#sitemap'


  get '/emails/test/property_management', to: 'email_test#property_management', as: 'property_management_email'
  get '/emails/test/modeling_agency', to: 'email_test#modeling_agency', as: 'modeling_agency_email'
  get '/emails/test/newsletter', to: 'email_test#newsletter', as: 'newsletter_email'


  get 'black_dashboard/dashboard', to: 'black_dashboard#dashboard', as: 'black_dashboard_dashboard'
  get 'black_dashboard/pricing', to: 'black_dashboard#pricing', as: 'black_dashboard_pricing'
  get 'black_dashboard/timeline', to: 'black_dashboard#timeline', as: 'black_dashboard_timeline'
  get 'black_dashboard/login', to: 'black_dashboard#login', as: 'black_dashboard_login'
  get 'black_dashboard/profile', to: 'black_dashboard#profile', as: 'black_dashboard_profile'
  get 'black_dashboard/buttons', to: 'black_dashboard#buttons', as: 'black_dashboard_buttons'
  get 'black_dashboard/grid', to: 'black_dashboard#grid', as: 'black_dashboard_grid'
  get 'black_dashboard/panels', to: 'black_dashboard#panels', as: 'black_dashboard_panels'
  get 'black_dashboard/alerts', to: 'black_dashboard#alerts', as: 'black_dashboard_alerts'
  get 'black_dashboard/notifications', to: 'black_dashboard#notifications', as: 'black_dashboard_notifications'
  get 'black_dashboard/typography', to: 'black_dashboard#typography', as: 'black_dashboard_typography'
  get 'black_dashboard/forms_extended', to: 'black_dashboard#forms_extended', as: 'black_dashboard_forms_extended'
  get 'black_dashboard/forms_regular', to: 'black_dashboard#forms_regular', as: 'black_dashboard_forms_regular'
  get 'black_dashboard/forms_validation', to: 'black_dashboard#forms_validation', as: 'black_dashboard_forms_validation'
  get 'black_dashboard/forms_wizard', to: 'black_dashboard#forms_wizard', as: 'black_dashboard_forms_wizard'
  get 'black_dashboard/tables_regular', to: 'black_dashboard#tables_regular', as: 'black_dashboard_tables_regular'
  get 'black_dashboard/tables_extended', to: 'black_dashboard#tables_extended', as: 'black_dashboard_tables_extended'
  get 'black_dashboard/tables_datatables', to: 'black_dashboard#tables_datatables', as: 'black_dashboard_tables_datatables'
  get 'black_dashboard/maps_google', to: 'black_dashboard#maps_google', as: 'black_dashboard_maps_google'
  get 'black_dashboard/maps_full_screen', to: 'black_dashboard#maps_full_screen', as: 'black_dashboard_maps_full_screen'
  get 'black_dashboard/maps_vector', to: 'black_dashboard#maps_vector', as: 'black_dashboard_maps_vector'
  get 'black_dashboard/widgets', to: 'black_dashboard#widgets', as: 'black_dashboard_widgets'
  get 'black_dashboard/charts', to: 'black_dashboard#charts', as: 'black_dashboard_charts'
  get 'black_dashboard/calendar', to: 'black_dashboard#calendar', as: 'black_dashboard_calendar'
  get 'black_dashboard/nomcre_login', to: 'black_dashboard#nomcre_login', as: 'black_dashboard_nomcre_login'

  #root 'khaki#nomcre_home'
  root 'application#home'

end
