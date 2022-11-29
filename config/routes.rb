Rails.application.routes.draw do
  devise_for :users
  root to: 'posts#index'
  resources :users, only: [:show, :edit, :update]
  resources :posts
  resources :items, only: [:index, :new, :create, :show, :edit]

end
