Rails.application.routes.draw do
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
  root to:'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
