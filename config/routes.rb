Rails.application.routes.draw do



  get 'purchases/new'

  get 'purchases/update'

  get 'purchases/edit'

  get 'purchases/show'

  get 'purchases/index'

  get 'purchases/delete'

  devise_for :users
  root 'users#home'

  resources :users


  resources :company_profiles

  resources :items

  resources :suppliers

  resources :sales

  resources :item_groups

  resources :stocks

  resources :units

  resources :customers

  resources :logs

  resources :current_fiscal_years


  resources :fiscal_years

  devise_scope :users do
    get 'create', to: 'devise/registrations#new'
  end
  end


