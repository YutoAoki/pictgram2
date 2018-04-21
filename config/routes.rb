Rails.application.routes.draw do


  get 'favorites/index'

  get 'topics/new'

  get 'users/new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#index'
  #get "top" => "pages#index"
  get 'pages/help'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'  #form_forは指定しなければ基本的にpostのルーティングを選択／link_toは基本getを選択。
  delete '/logout', to: 'sessions#destroy'

  resources 'users'
  resources 'topics' do
    resources 'comments'
  end

  post '/favorites', to: 'favorites#create'
  get '/favorites', to: 'favorites#index'
end

#get 'pages/help' => 'pages#help'
