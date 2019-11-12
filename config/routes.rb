Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/dashboard', to: 'users#show', as: 'dashboard'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :packages, only: [:index, :show, :new, :create] do
    resources :orders, only: [:create]
  end

end
