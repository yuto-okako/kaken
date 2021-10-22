Rails.application.routes.draw do
  root 'users#index'      #トップページへのルーティング

  get    '/login',  to: 'sessions#new'      #ログイン
  post   '/login',  to: 'sessions#create'   #ログイン
  delete '/logout', to: 'sessions#destroy'  #ログアウト
  
  resources :users
  resources :temperatures
  resources :checks
  resources :missions
  resources :games
  
  get  '/gacha'     , to: 'games#gacha'
  post '/get_gacha' , to: 'games#get_gacha'
  get '/mix'        , to: 'games#mix'
  get '/mix/:id'    , to: 'games#mixing', as: :games_mixing
  get  '/list'      , to: 'games#list'
  get  '/have'      , to: 'games#have'
end