Rails.application.routes.draw do
  resources :locations
  resources :cohorts
  get 'pages/home'
  get 'pages/about'
  get 'pages/contact'

  devise_for :users
  root to:'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
