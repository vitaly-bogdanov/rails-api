Rails.application.routes.draw do
  root 'posts#index'
  namespace :api do
    namespace :v1 do
      scope :posts do # CRUD posts
        get '/', to: 'posts#index'
        post '/', to: 'posts#create'
        patch '/:id', to: 'posts#update'
        delete '/:id', to: 'posts#destroy'
      end
      scope :sessions do # auth
        get '/logged-in', to: 'sessions#logged_in'
      end
    end
    namespace :v2 do # auth v2
    end
  end

  post   '/posts',      to: 'posts#create'
  post   '/update/:id', to: 'posts#update'
  delete '/posts/:id',   to: 'posts#destroy'

  resources :sessions,     only: [:create]
  resources :registrations, only: [:create]

  post '/authorization', to: 'sessions#login'
  delete '/logout',    to: 'sessions#logout'
  get '/logged-in',  to: 'sessions#logged_in'

end
