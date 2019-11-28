Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :places

  # resources :reviews, except: [:new]

  resources :cards

  resources :experiences, only: [:index, :show]

  resources :users, only: [:show, :edit, :update]

  resources :bookings do
    resources :reviews, only: [:index, :new, :create]
  end

  resources :categories, only: [:index]

  get "/fetch_experiences" => 'experiences#from_category', as: 'fetch_experiences'
end
