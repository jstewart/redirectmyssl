Rails.application.routes.draw do
  devise_for :users
  resources :redirects

  # TODO: Create a "home" controller and route there instead
  root to: "redirects#index"
end
