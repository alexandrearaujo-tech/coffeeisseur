Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

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

  get "/search" => 'pages#search'
end
