Rails.application.routes.draw do
  resources :merits
  resources :organizations
  devise_for :users
  get 'welcome/index'

  root 'welcome#index'
end
