Rails.application.routes.draw do
  resources :members
  resources :merits
  resources :organizations 
  devise_for :users
  # devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register', edit: 'settings' }
  get 'welcome/index'

  post 'organizations/importBamboo'

  root 'welcome#index'
end
