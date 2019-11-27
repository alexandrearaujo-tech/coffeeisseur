Rails.application.routes.draw do
  get 'cards/show'
  get 'cards/index'
  get 'cards/new'
  get 'cards/destroy'
  get 'cards/update'
  get 'bookings/index'
  get 'bookings/show'
  get 'bookings/new'
  get 'bookings/create'
  get 'bookings/edit'
  get 'bookings/update'
  get 'bookings/destroy'
  devise_for :users
  root to: 'pages#home'

  resources :places

  resources :experiences, only: [:index, :show]

  resources :users, only: [:show]

  resources :bookings

  resources :categories, only: [:index]

  get "/fetch_experiences" => 'experiences#from_category', as: 'fetch_experiences'

end
