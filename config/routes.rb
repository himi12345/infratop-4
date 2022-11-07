Rails.application.routes.draw do
  root to: 'homes#top'
  devise_for :users

  get "homes/about"

  resources :users, only: [:show,:edit,:index]
  resources :books, only: [:new,:index,:show]
end
