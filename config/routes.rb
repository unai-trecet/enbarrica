Enbarrica::Application.routes.draw do
  root to: 'pages#front'
  resources :vinos
  resources :bodegas
end
