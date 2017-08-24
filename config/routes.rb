Rails.application.routes.draw do
  mount ActionCable.server => '/cable'
  resources :charges
  resources :tags
  resources :tag_types
  resources :housings do
    resources :photos
    get 'tags', to: 'housings#update_tags'
    post 'tags', to: 'housings#set_tags'
  end
  resources :photos
  resources :tracks do
    get 'events/', to: 'events#index'
  end
  resources :side_trips do
    get 'add/:id', to: 'side_trips#add_user', as: 'add_user'
    get 'remove/:id', to: 'side_trips#remove_user', as: 'remove_user'
    resources :transits
  end

  resources :location_details
  resources :posts
  resources :roles
  resources :lodgings
  resources :transits
  resources :companies
  resources :events do
    resources :event_comments
    resources :event_rsvps
    resources :photos
  end
  resources :locations
  resources :cohorts do
    get 'add/:id', to: 'cohorts#add_user', as: 'add_user'
    get 'remove/:id', to: 'cohorts#remove_user', as: 'remove_user'
    get 'events/new', to: 'events#new', as: 'new_event'
    get 'events', to: 'events#index', as: 'list_events'
    resources :side_trips
    resources :transits
    get 'photos', to: 'photos#index', as: 'list_photos'
    resources :schedule_items
  end
  get 'home', to: 'pages#home'
  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'
  get 'my-itinerary', to: "pages#my_itinerary"

  devise_for :users, controllers: { registrations: "registrations" }
  get 'users/:id', to: 'users#show', as: 'show_user'
  get 'users/:user_id/photos', to: 'photos#index', as: 'user_photos'
  get 'users/:id/preferences', to: 'users#preferences', as:'user_preferences'
  post'users/:id/housing_preferences', to: 'users#update_housing_preferences'
  post'users/:id/roomate_preferences', to: 'users#update_roomate_preferences'
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
  end


  root to:'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
