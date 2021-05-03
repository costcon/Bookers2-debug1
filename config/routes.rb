Rails.application.routes.draw do
  devise_for :users

  resources :users,only: [:show,:index,:edit,:update]
    resource :relationships, only: [:create, :destroy]
      get :follows, on: :menber
      get :followers, on: :menber
  resources :books do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]

  end

  get 'home/about' => 'homes#about'
  root 'homes#top'


end
