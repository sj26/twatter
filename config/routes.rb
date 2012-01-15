Twatter::Application.routes.draw do
  authenticated do
    root to: "home_timeline#show"
  end

  root to: "home#show"

  devise_for :users

  resources :tweets, only: [:new, :create, :show, :destroy]
  resource :public_timeline, only: :show
  resources :user_timelines, only: :show, path: ""
  resources :users, only: [:edit, :update], path: "" do
    member do
      get :follow, :unfollow
    end
    resources :followers, only: :index
    resources :followees, only: :index
    resources :mentions, only: :index
  end
end
