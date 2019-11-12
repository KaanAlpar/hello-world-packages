Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/dashboard', to: 'users#show', as: 'dashboard'

  resources :packages, only: [:index, :show, :new, :create] do
    resources :orders, only: [:create]
  end

end
