Rails.application.routes.draw do
  devise_for :users
  root to: 'posts#index'
  resources :users, only: [:show, :edit, :update]
  resources :posts
  resources :items do
    resources :purchases, only: [:index, :create]
  end
  resources :rooms, only: [:index, :new, :create, :show] do
    resources :messages, only: [:index, :create]
  end

end
