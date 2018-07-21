Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:show, :edit]

  resources :restaurants, only: [:index, :show] do
    resources :comments, only: [:create, :destroy]
  end
  resources :categories, only:[:show]
  root "restaurants#index"

  namespace :wzht do
    resources :restaurants
    resources :categories
    root "restaurants#index"
  end
end
