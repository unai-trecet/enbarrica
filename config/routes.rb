Enbarrica::Application.routes.draw do
  root to: 'pages#front'
  get 'sign_in', to: 'sessions#new'
  
  resources :vinos
  resources :bodegas
  resources :denominaciones
  resources :tipo_uvas, only: [:show]
  resources :envejecimientos, only: [:show]
end
