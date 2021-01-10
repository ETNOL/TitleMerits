Rails.application.routes.draw do
  resources :organizations
  devise_for :users
  get 'welcome/index'

  root 'welcome#index'
end
