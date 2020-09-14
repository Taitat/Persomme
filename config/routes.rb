Rails.application.routes.draw do
  
  get 'questions/search'
  get 'posts/create_complete'
  get 'users/favorites'
  post 'users/enchant'
  root to: "posts#index"
  devise_for :users

  resources :users, only: [:show] do
    resources :answers, only: [:index,:show,:create]
  end

  resources :questions, only: [:index,:new,:create,:show]
  resources :characteristics, only: [:index,:create]
  resources :posts, only: [:index, :create, :show, :destroy] do
    resources :comments, only: [:create, :destroy]
    resources :favorites, only: [:create, :destroy]
  end
  

  
end
