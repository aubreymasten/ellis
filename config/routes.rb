Rails.application.routes.draw do
  devise_for :users

  root to: "stories#index"

  resources :accounts do
    resources :stories
  end

  resources :stories do
    resources :scenes
  end

  resources :scenes do
    resources :choices
  end
end
