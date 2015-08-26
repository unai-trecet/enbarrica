Enbarrica::Application.routes.draw do

  root to: 'pages#front'

  resources :sessions, only: [:create]
  get 'sign_in', to: 'sessions#new'

  resources :comentarios, only: [:new, :create, :edit, :update, :delete]
  concern :comentable do
    resources :comentarios, only: [:new, :create, :edit, :update, :delete]
  end

  resources :ratings, only: [:create, :update]

  resources :vinos, concerns: :comentable
  resources :bodegas, concerns: :comentable
  resources :denominaciones, only: [:show], concerns: :comentable

  resources :users, concerns: :comentable, only: [:create, :update, :show, :edit]
  get 'register', to: 'users#new'
  get 'sign_out', to: 'sessions#destroy'  

  
  resources :tipo_uvas, only: [:show]
  resources :envejecimientos, only: [:show]
  resources :lists
  
end
