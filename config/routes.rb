Rails.application.routes.draw do
  resources :applicants
  resources :tickets do
    get 'assign', to: 'tickets#assign', as: 'assign'
    get 'resolve', to: 'tickets#resolve', as: 'resolve'
    post 'assign/', to: 'tickets#assign_to', as: 'assign_user'
  end
  resources :ratings
  get 'contact_submissions/message_thank_you', to: 'contact_submissions#message_thank_you'
  resources :contact_submissions

  resources :user_announcements
  resources :organizations do
    resources :cohorts
  end
  resources :conversations do
    resources :emails
  end
  resources :profiles
  mount ActionCable.server => '/cable'
  namespace :admin do
    resources :users
    root to: 'application#index'
  end
  get 'notifications', to: 'notifications#index'
  get 'admin/events', to:'admin#events'
  get 'admin/event/:event_id/upgrade/:user_id', to: 'admin#upgrade_from_waitlist', as:'upgrade_from_waitlist'
  get 'admin/event/:event_id/add_rsvp/:user_id', to: 'admin#create_event_rsvp', as: 'create_event_rsvp'
  get 'admin/dashboard', to: 'admin#dashboard', as: 'admin_dashboard'

  get 'invite', to: 'invites#invite'
  post 'invites/new/:user_id', to: 'invites#create'
  get 'invite/new', to: 'invites#new'
  get 'invite/sent', to: 'invites#sent', as: "invite_sent"



  resources :charges
  resources :tags
  resources :tag_types
  resources :housings do
    resources :photos
    get 'tags', to: 'housings#update_tags'
    post 'tags', to: 'housings#set_tags'
    resources :ratings
  end
  resources :photos
  resources :tracks do
    resources :events
    resources :ratings
  end
  resources :side_trips do
    get 'add/:id', to: 'side_trips#add_user', as: 'add_user'
    get 'remove/:id', to: 'side_trips#remove_user', as: 'remove_user'
    get 'invite', to: 'side_trips#invite', as: 'invite'
    post 'invite', to: 'side_trips#create_invitations', as: 'create_invitations'
    resources :transits
    resources :photos
    resources :lodgings
    resources :events
  end


  resources :posts
  resources :roles
  resources :lodgings
  resources :transits
  resources :companies
  resources :events do
    resources :event_comments
    resources :event_rsvps
    resources :photos
    resources :ratings
    get 'waitlist/add/:user_id', to: "event_waitlists#create", as:'waitlist_add_user'
    get 'waitlist/remove/:user_id', to: "event_waitlists#destroy", as:'waitlist_remove_user'
    get 'admin', to: 'admin#events'
    post 'move_to_track', to: "events#move_to_track", as: "move_to_track"
  end
  resources :locations do
    resources :location_details
    resources :ratings
  end

  resources :cohorts do
    get 'add/:id', to: 'cohorts#add_user', as: 'add_user'
    get 'remove/:id', to: 'cohorts#remove_user', as: 'remove_user'
    get 'events/new', to: 'events#new', as: 'new_event'
    get 'events', to: 'events#index', as: 'list_events'
    resources :side_trips
    resources :transits
    get 'photos', to: 'photos#index', as: 'list_photos'
    resources :schedule_items
    resources :announcements
    resources :side_trips
    resources :tickets
    resources :tracks
  end
  get 'home', to: 'pages#home'
  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'
  get 'my-itinerary', to: "user_pages#my_itinerary"
  get 'my-events', to: "user_pages#my_events"
  get 'my-photos', to: "user_pages#my_photos"
  get 'my-sidetrips', to: "user_pages#my_sidetrips"
  get 'my-housings', to: "user_pages#my_housings"

  devise_for :users, :skip => [:registrations], :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  as :user do
  # Registrations
  get   '/signup'   => 'devise/registrations#new', as: :new_user_registration
  post  '/signup'   => 'devise/registrations#create', as: :user_registration
  get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'
  put 'users' => 'devise/registrations#update', :as => 'user_updadte_registration'
  end
  get '/account', to: 'pages#account'

  get 'users/:id', to: 'users#show', as: 'show_user'
  get 'users/:user_id/photos', to: 'photos#index', as: 'user_photos'
  get 'users/:user_id/photos/new', to: 'photos#new', as: 'new_user_photo'
  get 'users/:id/preferences', to: 'users#preferences', as:'user_preferences'
  post'users/:id/housing_preferences', to: 'users#update_housing_preferences'
  post'users/:id/roomate_preferences', to: 'users#update_roomate_preferences'
  get 'users/:id/skills', to: 'users#skills', as: 'user_skills'
  post'users/:id/skills', to: 'users#update_skills'
  get 'admin/cohorts'
  get 'admin/cohort/:cohort_id/managers', to: 'admin#cohort_managers', as: 'cohort_managers'
  get 'admin/cohort/:cohort_id/cohort_managers/add/:user_id', to: 'admin#add_cohort_manager', as: 'add_cohort_manager'
  get 'admin/cohort/:cohort_id/cohort_managers/remove/:user_id', to: 'admin#remove_cohort_manager', as: 'remove_cohort_manager'
  get 'admin/housing'
  get 'admin/housing/location/:location_id', to: 'admin#housing', as: 'admin_housing_location'
  get 'admin/housing/housing/:housing_id', to: 'admin#housing', as: 'admin_housing_unit'
  get 'admin/housing/:housing_id/user/:user_id/add', to: 'admin#assign_user_to_housing', as: 'admin_housing_add_user'
  get 'admin/housing/:housing_id/user/:user_id/remove', to: 'admin#remove_user_from_housing', as: 'admin_housing_remove_user'

  resources :chat_rooms, only: [:new, :create, :show, :index] do
    get '/leave', to: 'chat_rooms#leave_room', as: 'leave_room'
    post 'message', to: 'messages#create'
  end


  root to:'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
