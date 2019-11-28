Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'map', to: 'pages#map', as: 'map'

  resources :places

  # resources :reviews, except: [:new]

  resources :cards

  resources :experiences, only: [:index, :show]  do
    resources :reviews, only: [:new]
  end


  resources :users, only: [:show, :edit, :update]

  resources :bookings

  resources :categories, only: [:index]

  get "/fetch_experiences" => 'experiences#from_category', as: 'fetch_experiences'
end
