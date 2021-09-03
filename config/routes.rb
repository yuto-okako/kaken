Rails.application.routes.draw do
  get 'sessions/new'
  root 'users#index'      #トップページへのルーティング

  get    '/login',  to: 'sessions#new'      #ログイン
  post   '/login',  to: 'sessions#create'   #ログイン
  delete '/logout', to: 'sessions#destroy'  #ログアウト
  
  resources :users
  resources :temperatures
  resources :checks
  resources :missions
end