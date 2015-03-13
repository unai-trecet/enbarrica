Enbarrica::Application.routes.draw do

  root to: 'pages#front'

  resources :sessions, only: [:create]
  get 'sign_in', to: 'sessions#new'
  
  resources :users
  get 'register', to: 'users#new'
  get 'sign_out', to: 'sessions#destroy'

  resources :vinos do
    resources :comentarios, only:  [:index, :new, :create]
  end

  resources :bodegas do
    resources :comentarios, only:  [:index, :new, :create]
  end

  resources :denominaciones, only: [:show] do
    resources :comentarios, only:  [:index, :new, :create]
  end

  resources :comentarios, only:  [:show, :edit, :update, :destroy]
  resources :tipo_uvas, only: [:show]
  resources :envejecimientos, only: [:show]
end
