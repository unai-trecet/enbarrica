Enbarrica::Application.routes.draw do
  root to: 'pages#front'
  resources :vinos
  resources :bodegas
  resources :denominaciones
  resources :tipo_uvas, only: [:show]
  resources :envejecimiento, only: [:show]
end
