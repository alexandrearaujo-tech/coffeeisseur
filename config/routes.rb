Rails.application.routes.draw do
  get 'experiences/indexshow'
  get 'categories/index'
  devise_for :users
  root to: 'pages#home'

  resources :places, only: [:index, :show]

  resources :experiences, only: [:index, :show]

  resources :users, only: [:show]

  resources :bookings

  resources :categories, only: [:index]

end
