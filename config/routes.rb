Rails.application.routes.draw do
  mount ActionCable.server => '/cable'
  get 'cards/new'
  
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions',
   }

  devise_scope :user do
    get "sign_in", :to => "users/sessions#new"
    get "sign_out", :to => "users/sessions#destroy" 
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end

  root to: "top_pages#index"
  resources :top_pages, only: [:index, :show]
  resources :posts do
    resources :evaluations, only: [:index, :create]
  end
  resources :posts
  resources :evaluations
  resources :relationships, only: [:create, :destroy]

  resources :cards, only: [:new, :create]
  resources :posts, only: :order do
    post 'order', on: :member
  end
  
  resources :users do
  resources :secret, only: [:index, :show]
  end

  resources :users, only: :show
  get 'chat/:id' => 'chats#show', as: 'chat'
  resources :chats, only: [:create]

  post "likes/:post_id/create" => "likes#create"
  post "likes/:post_id/destroy" => "likes#destroy"
end
