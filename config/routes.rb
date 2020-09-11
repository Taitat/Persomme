Rails.application.routes.draw do
  
  get 'questions/search'
  post 'users/enchant'
  root to: "posts#index"
  devise_for :users

  resources :users, only: [:show] do
    resources :answers, only: [:index,:show,:create]
  end

  resources :questions, only: [:index,:new,:create,:show]
  resources :characteristics, only: [:index,:create]
  resources :posts, only: [:index, :create]

  
end
