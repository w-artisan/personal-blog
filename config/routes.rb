Rails.application.routes.draw do
  resources :blogs
  get 'pages/home'
  get 'pages/about'
  get 'about-me', to: 'pages#about'
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
