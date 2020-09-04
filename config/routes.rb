Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "questions#index"
  resources :users, only: [:show] do
    member do
      get 'questions_list'
    end
    
    resources :answers, only: [:index,:show,:create]
    
  end

  resources :questions, only: [:new,:create]


  
end
