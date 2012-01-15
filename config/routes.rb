Twatter::Application.routes.draw do
  authenticated do
    root to: "home_timeline#show"
  end

  root to: "home#show"

  devise_for :users

  resources :tweets, only: [:create, :show]
  resource :public_timeline, only: :show
  resources :user_timelines, only: :show, path: ""
  resources :users, only: [:edit, :update], path: "" do
    member do
      get :follow, :unfollow
    end
    resources :mentions, only: :index
  end
end
