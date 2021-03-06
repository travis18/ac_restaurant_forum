Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:show, :edit, :update, :index] do
    member do
      get :friends_list
    end
  end

  resources :followships, only: [:create, :destroy]
  resources :friendships, only: [:create, :destroy]

  resources :restaurants, only: [:index, :show] do
    resources :comments, only: [:create, :destroy]

    collection do
      get :feeds
      get :ranking
    end

    member do
      get :dashboard

      # for favorite/unfavorite
      post :favorite
      post :unfavorite

      # for like/unlike
      post :like
      post :unlike
    end
  end
  resources :categories, only:[:show]
  root "restaurants#index"

  namespace :wzht do
    resources :restaurants
    resources :categories
    root "restaurants#index"
  end
end
