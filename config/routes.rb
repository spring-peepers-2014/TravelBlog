Rails.application.routes.draw do
  root to: "trips#index"
  resources :users, :only => [:new, :create]
  resources :trips, :only => [:new, :create, :index]
  resources :trips, shallow: true do
    resources :locations, :only => [:index, :show, :create, :destroy]
  end
  resources :locations, :only => [:index, :show, :create, :destroy], shallow: true do
    resources :posts
    resources :photos, :only => [:create, :delete]
  end

  post '/users/login', to: 'users#login'
  get '/users/logout', to: 'users#logout'

end