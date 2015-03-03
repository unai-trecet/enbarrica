Enbarrica::Application.routes.draw do

  root to: 'pages#front'

  resources :sessions, only: [:create]
  get 'sign_in', to: 'sessions#new'
  
  resources :users
  get 'register', to: 'users#new'
  get 'sign_out', to: 'sessions#destroy'

  resources :vinos
  resources :bodegas
  resources :denominaciones
  resources :tipo_uvas, only: [:show]
  resources :envejecimientos, only: [:show]
  resources :comentarios, only: [:new, :create, :update, :destroy]
end
