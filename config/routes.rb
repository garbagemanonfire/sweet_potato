SpApp::Application.routes.draw do

  devise_for :users
  # resources :users, :only => [:show]
  resources :users do
    member do
      get :engaging
    end
  end

  resources :events do
    member do
      get :users
    end
  end

  resources :retreatregs, only: [:create, :destroy, :update]

  root  'static_pages#home'
  match '/signup',  to: 'users#new',            via: 'get'
  match '/organize',  to: 'events#new',         via: 'get'
  match '/help',    to: 'static_pages#help',    via: 'get'
  match '/about',   to: 'static_pages#about',   via: 'get'
  match '/contact', to: 'static_pages#contact', via: 'get'
  match '/sendgrid', to: 'static_pages#sendgrid', via: 'get'

end
