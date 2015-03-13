Enbarrica::Application.routes.draw do

  root to: 'pages#front'

  resources :sessions, only: [:create]
  get 'sign_in', to: 'sessions#new'
  
  resources :users
  get 'register', to: 'users#new'
  get 'sign_out', to: 'sessions#destroy'

  resources :comentarios

  concern :comentable do
    resources :comentarios
  end

  resources :vinos, concerns: :comentable
  resources :bodegas, concerns: :comentable
  resources :denominaciones, only: [:show], concerns: :comentable

  
  resources :tipo_uvas, only: [:show]
  resources :envejecimientos, only: [:show]
end
