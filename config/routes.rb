Rails.application.routes.draw do
  root to: 'home#top'
  devise_for :users, controllers: {
  registrations: 'users/registrations',
  sessions: 'users/sessions',
  }

  get "home/about"

  resources :users, only: [:show,:edit,:index,:update,:destroy]
  resources :books, only: [:new,:index,:show,:create,:destroy,:edit,:update]

end