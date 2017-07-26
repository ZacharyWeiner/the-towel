Rails.application.routes.draw do
  resources :roles
  resources :lodgings
  resources :transits
  resources :companies
  resources :events
  resources :locations
  resources :cohorts do 
    get 'add/:id', to: 'cohorts#add_user', as: 'add_user'
    get 'remove/:id', to: 'cohorts#remove_user', as: 'remove_user'
  end 
  get 'home', to: 'pages#home'
  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'

  devise_for :users
  get 'users/:id', to: 'users#show', as: 'show_user'
  get 'admin/cohorts'
  get 'admin/cohort/:cohort_id/managers', to: 'admin#cohort_managers', as: 'cohort_managers'
  get 'admin/cohort/:cohort_id/cohort_managers/add/:user_id', to: 'admin#add_cohort_manager', as: 'add_cohort_manager'
  get 'admin/cohort/:cohort_id/cohort_managers/remove/:user_id', to: 'admin#remove_cohort_manager', as: 'remove_cohort_manager'
  root to:'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
