Rails.application.routes.draw do
  devise_for :users
  devise_scope :users do
    get '/users', to: redirect("/users/sign_up")
  end

  root to: "posts#index"
  resources :posts do
    resources :evaluations, only: [:index, :show, :create]
  end
  resources :users
  resources :posts do
    resources :orders, only: [:index, :create]
  end
end
