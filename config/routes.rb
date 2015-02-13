Enbarrica::Application.routes.draw do
  root to: 'pages#front'
  resources :vinos
  resources :bodegas
  resources :denominaciones
  resources :tipo_uvas
end
