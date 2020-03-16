Rails.application.routes.draw do
  root 'posts#index'

  post   '/posts',      to: 'posts#create'
  post   '/update/:id', to: 'posts#update'
  delete '/posts/:id',   to: 'posts#destroy'

  resources :sessions,     only: [:create]
  resources :registrations, only: [:create]

  delete '/logout', to: 'sessions#logout'
  get '/logged-in', to: 'sessions#logged_in'

end
