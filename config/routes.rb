Twatter::Application.routes.draw do
  root to: "public_timelines#show"

  devise_for :users

  authenticate do
    get :timeline, to: "home_timeline#show"

    resources :tweets, only: [:new, :create, :destroy]
    resources :users, path: "", only: [:edit, :update] do
      member do
        get :follow, :unfollow
      end
    end
  end

  resources :tweets, only: [:show]

  resources :user_timelines, only: :show, path: ""
  resources :users, path: "", only: [] do
    resources :followers, only: :index
    resources :followees, only: :index, path: "following"
    resources :mentions, only: :index
  end
end
