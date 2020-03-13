Rails.application.routes.draw do
  root 'posts#index'

  post   '/posts',      to: 'posts#create'
  post   '/update/:id', to: 'posts#update'
  delete '/posts/:id',  to: 'posts#destroy'
end
