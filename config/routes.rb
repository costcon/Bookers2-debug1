Rails.application.routes.draw do



  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }

  resources :users,only: [:show,:index,:edit,:update] do
    resource :relationships, only: [:create, :destroy]
    get :follows, on: :member
    get :followers, on: :member
  end

  resources :books do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]


  end


  get 'search' => "searches#search"


  get 'chat/:id', to: 'chats#show', as: 'chat'
  resources :chats, only: [:create]


  get 'home/about' => 'homes#about'
  root 'homes#top'

  get 'unsubscribe/:name' => 'homes#unsubscribe', as: 'confirm_unsubscribe'
  patch ':id/withdraw/:name' => 'homes#withdraw', as: 'withdraw_user'
  put 'withdraw/:name' => 'users#withdraw'


end
