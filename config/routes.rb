Rails.application.routes.draw do
  root 'trips#index'
  resources :users, :only => [:new, :create]
  resources :trips, :only => [:new, :create, :index]
  resources :trips, shallow: true do
    resources :posts
  end

  post '/users/login', to: 'users#login'
  get '/users/logout', to: 'users#logout'

end
