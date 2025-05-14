Rails.application.routes.draw do
  root 'posts#index'

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show]
  end
  resources :posts, only: [:index, :show]
  resources :comments, only: [:index, :show]
  resources :hashtags, only: [:index, :show]
end