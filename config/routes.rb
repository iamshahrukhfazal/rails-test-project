# frozen_string_literal: true

Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  resource :users do 
      get '/user_profile', to: 'users#user_profile'
  end
  resources :likes, only: %i[create destroy]
  resource :reports, only: %i[create destroy] do
    collection do
      get '/reported_post', to: 'reports#all_reported_post'
      get '/reported_comment', to: 'reports#all_reported_comment'
      post '/search_post', to: 'posts#search'
    end
  end
  resources :posts, shallow: true do
    resources :comments, only: %i[create destroy]
    resources :suggestions
  end

  root to: 'pages#home'
end
