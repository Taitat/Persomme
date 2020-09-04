Rails.application.routes.draw do
  get 'posts/index'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "posts#index"
  resources :users, only: [:show] do
    resources :answers, only: [:index,:show,:create]
  end

  resources :questions, only: [:index,:new,:create,:show]


  
end
