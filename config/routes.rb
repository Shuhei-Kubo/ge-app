Rails.application.routes.draw do
  devise_for :users
  root to: 'posts#index'
  
  resources :posts, only: [:new, :index, :create]
  resources :users, only: [:edit, :index]

 

end
