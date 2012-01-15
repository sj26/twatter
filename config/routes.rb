Twatter::Application.routes.draw do
  authenticated do
    root to: "home_timeline#show"
  end

  root to: "home#show"

  resources :tweets, only: [:create, :show]
  get :public_timeline, to: "public_timeline#show"

  devise_for :users

  resources(:users, only: :show, path: "") do
    member do
      get :follow, :unfollow
    end
  end
end
