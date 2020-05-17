Rails.application.routes.draw do
  root 'api/v1/posts#index'
  namespace :api do
    namespace :v1 do
      scope :posts do # CRUD posts
        get '/', to: 'posts#index', as: 'all_posts'
        post '/', to: 'posts#create', as: 'create_post'
        patch '/:id', to: 'posts#update', as: 'update_post'
        delete '/:id', to: 'posts#destroy', as: 'destroy_post'
      end
      scope :sessions do # auth
        get '/logged-in', to: 'sessions#logged_in', as: 'logged_id'
        post '/login', to: 'sessions#login', as: 'login'
        delete '/logout', to: 'sessions#logout', as: 'logout'
      end
      scope :users do # registartion
        post '/create', to: 'users#create', as: 'create_user'
      end
    end
    namespace :v2 do
    end
  end
end
