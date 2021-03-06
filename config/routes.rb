Rails.application.routes.draw do
  
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' ,to: 'devise/sessions#destroy'
  end
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end

  get 'books/search'
  get 'questions/search'
  get 'posts/create_complete'
  get 'posts/search', to: "posts#search"
  post 'users/enchant'
  root to: "posts#index"

  resources :users, only: [:show] do
    member do
      get 'favorites'
    end
    resources :answers, only: [:index,:show,:create]
  end

  resources :questions, only: [:index,:new,:create,:show]
  resources :characteristics, only: [:index,:create]
  resources :posts, only: [:index, :create, :show, :destroy] do
    resources :comments, only: [:create, :destroy]
    resources :favorites, only: [:create, :destroy]
  end


  

  
end
