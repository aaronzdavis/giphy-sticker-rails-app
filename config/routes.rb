Rails.application.routes.draw do
  root 'home#index'

  # Users
  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  # Sessions
  get '/login'  => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  # Dashboard
  get '/dashboard' => 'dashboard#index'

end
