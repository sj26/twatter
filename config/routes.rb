Twatter::Application.routes.draw do
  authenticated do
    root to: "home_timeline#show"
  end

  root to: "home#show"

  resources :statuses, only: :create

  devise_for :users
end
