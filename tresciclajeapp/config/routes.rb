Rails.application.routes.draw do
  resources :offers
  resources :materials, only: [:index, :new, :create, :show]
  resources :categories

  resources :petitions do
    resources :invoices, only: [:index], controller: 'petition/invoices'
  end

  resources :invoices, only: [:create]

  devise_for :users, controllers: {
        sessions: 'users/sessions'
      }

  # get 'users/new'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root to: 'core/home#index'

  scope module: 'admin', path: 'admin' do
    resources :sources
    resources :schedules
    resources :itineraries, only: [:new, :create]
    resources :zones
  end
  resources "contacts", only: [:new, :create]

  namespace :core do
    resources :users
    post 'users/add_role', to: 'users#add_role'
    post 'users/remove_role', to: 'users#remove_role'
    resources :recycling_records
    resources :association_records    
  end  
end
