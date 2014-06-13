Rails.application.routes.draw do
  root "trips#index"
  resources :users, :only => [:new, :create]
  resources :trips, :only => [:new, :create, :index]

  # Avoid clumsy URL's from deep-level nesting
  # Best Practice: don't go deeper than 1-level nesting
  # see http://guides.rubyonrails.org/routing.html#shallow-nesting
  resources :trips, shallow: true do
    resources :posts
    resources :photos
  end

  post '/users/login', to: 'users#login'
  get '/users/logout', to: 'users#logout'

end

# path_name
# controller actions

# POSTS

# trip_posts
# get '/trips/:trip_id/posts(.:format)' => posts#index

# no_path_name
# post '/trips/:trip_id/posts(.:format)' => posts#create

# new_trip_post
# get '/trips/:trip_id/posts/new(.:format)' => posts#new

# edit_post
# get '/posts/:id/edit(.:format)' => posts#edit

# post
# get '/posts/:id(.:format)' => posts#show

# no_path_name
# put '/posts/:id(.:format)'  => posts#update

# no_path_name
# delete '/posts/:id(.:format)' => posts#destroy

# PHOTOS

# trip_photos
# get '/trips/:trip_id/photos(.:format)' => photos#index

# no_path_name
# post '/trips/:trip_id/photos(.:format)' => photos#create

# new_trip_photo
# get '/trips/:trip_id/photos/new(.:format)' => photos#new

# edit_post
# get '/photos/:id/edit(.:format)' => photos#edit

# photo
# get '/photos/:id(.:format)' => photos#show

# no_path_name
# put '/photos/:id(.:format)'  => photos#update

# no_path_name
# delete '/photos/:id(.:format)' => photos#destroy