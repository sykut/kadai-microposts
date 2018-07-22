Rails.application.routes.draw do
  root to: 'toppages#index'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'signup', to: 'users#new'
  resources :users, only: [:index, :show, :new, :create] do
    member do
      get :followings
      get :followers
      get :likes
    end
  end
  
  get 'signup', to: 'microposts#new'
  # resources :microposts, only: [:index, :show, :new, :create] do
  #   member do
  #     get :tofavorites
  #     get :favoritings
  #   end
  # end

  resources :microposts, only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]
  resources :favorites, only: [:index, :show, :create, :destroy,]
end
