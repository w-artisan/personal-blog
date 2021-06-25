Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, path: "", path_names: {
    sign_in: "login",
    sign_out: "logout",
    sign_up: "register"
  }

  resources :blogs
  get 'pages/home'
  get 'pages/about'
  get 'about-me', to: 'pages#about'
  root to: 'pages#home'

  resources :blogs do
    resources :comments, only: [:create]
    member do
      get :get_comments
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
