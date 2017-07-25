Rails.application.routes.draw do
  resources :lodgings
  resources :transits
  resources :companies
  resources :events
  resources :locations
  resources :cohorts do 
    post 'user/:id', to: 'cohorts#add_user', as: 'add_user'
  end 
  get 'pages/home'
  get 'pages/about'
  get 'pages/contact'

  devise_for :users
  get 'admin/cohorts'
  root to:'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
