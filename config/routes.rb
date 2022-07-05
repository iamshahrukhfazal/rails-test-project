# frozen_string_literal: true

Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  resources :likes, only: %i[create destroy]
  resources :reports, only: %i[create destroy]
  resources :posts, shallow: true do
    resources :comments, only: %i[create destroy]
    resources :suggestions
  end
  get '/reportedpost', to: 'reports#all_reported_post'
  get '/reportedcomment', to: 'reports#all_reported_comment'
  get '/userprofile', to: 'pages#user_profile'
  post '/posts/searchpost', to: 'posts#search'
  root to: 'pages#home'
end
