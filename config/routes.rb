Rails.application.routes.draw do
 
  root 'home#index'
  get 'home/index'
  resources :users
  resources :users do
  resources :posts
  end


  resources :sessions, only: [:new, :create, :destroy]
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :posts do
    member do
      post 'like'
    end
  end
  resources :users do
    resources :posts do
      resources :comments, only: [:create]
    end
  end

end
