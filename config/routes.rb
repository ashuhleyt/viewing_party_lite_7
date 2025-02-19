Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'welcome#index'

  get '/register', to: 'users#new'
  post '/register', to: 'users#create'

  get '/login', to: 'users#login_form'
  post '/login', to: 'users#login_user'

  get '/logout', to: 'users#logout'

  resources :users, only: [:show, :create] do 
    resources :discover, only: [:index]
    resources :movies, only: [:index] do 
      
    end
  end

end
