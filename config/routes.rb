Rails.application.routes.draw do
  devise_for :users

  root to: "stories#index"

  get "hide_details" => "stories#hide_details"
  get "show_details" => "stories#show_details"
  get "show_edit" => "stories#show_edit"
  get "hide_edit" => "stories#hide_edit"
  get "toggle_publicity" => "stories#toggle_publicity"
  get "show_add_scene" => "scenes#show_add_scene"

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
