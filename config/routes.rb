Rails.application.routes.draw do
  devise_for :users
  root to: 'posts#index'
  
  resources :posts, only: [:new, :create, :edit, :update, :destroy, :update]
  resources :users, only: [:edit, :index, :show, :update]

 

end
