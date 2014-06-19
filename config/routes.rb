Rails.application.routes.draw do
  root "trips#index"
  resources :users, :only => [:new, :create, :destroy]
  resources :trips, shallow: true do
    resources :locations, :only => [:index, :show, :create, :destroy], :controller => "location_pins"
    resources :posts
    resources :photos, :only => [:create, :destroy]
  end

  post '/users/login', to: 'users#login'
  get '/users/logout', to: 'users#logout'

  end
