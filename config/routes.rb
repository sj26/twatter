Twatter::Application.routes.draw do
  authenticated do
    root to: "home_timeline#show"
  end

  root to: "home#show"

  resources :statuses, only: [:create, :show]
  resources :users, only: :show, path: ""

  devise_for :users
end
