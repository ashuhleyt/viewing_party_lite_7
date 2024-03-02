Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'welcome#index'

  # Registration Routes
  get '/register', to: 'users#new'
  post '/register', to: 'users#create'

  # Login Routes
  get '/login', to: 'users#login_form'
  post '/login', to: 'users#login_user'

  # Logout Route
  get '/logout', to: 'users#logout'

  # User Resources
  resources :users, only: [:show, :create]
end
