Rails.application.routes.draw do

  resources :resas
  resources :frances
  resources :belgia
  resources :folevents
  resources :folorgs
  resources :foldates
  resources :events
  resources :orgns
  root to: 'visitors#index'
  devise_for :users
  resources :users

  get '/proagenda', to: 'agenda#index'
end
