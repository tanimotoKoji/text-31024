Rails.application.routes.draw do
  get 'cards/new'
  devise_for :users
  #devise_scope :users do
    #get '/users', to: redirect("/users/sign_up")
  #end

  root to: "posts#index"
  resources :posts do
    resources :evaluations, only: [:index, :create]
  end

  resources :evaluations
  
  resources :cards, only: [:new, :create]
  resources :posts, only: :order do
    post 'order', on: :member
  end

  resources :users, only: :show
  get 'chat/:id' => 'chats#show', as: 'chat'
  resources :chats, only: [:create]

  post "likes/:post_id/create" => "likes#create"
  post "likes/:post_id/destroy" => "likes#destroy"
end
