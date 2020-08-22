Rails.application.routes.draw do
  devise_for :users
  root to: 'posts#index'
  
  resources :posts do
    resources :comments, only: [:create, :destroy]
    resource :likes, only: [:create, :destroy]

    collection do
      get 'search'
      end
  end
  
  resources :users, only: [:edit, :index, :show, :update] do
  end
end
