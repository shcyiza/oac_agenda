Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :activities
  resources :resas
  resources :frances
  resources :belgia
  resources :folevents
  resources :folorgs
  resources :foldates
  resources :events
  resources :orgns
  resources :contacts, only: [:new, :create]
  root to: 'visitors#index'
  devise_for :users
  resources :users

  get '/proagenda', to: 'agenda#index'
  get '/3etapes', to: 'visitors#firstconnection'
  get '/mboka', to: 'visitors#mboka'
  get '/event/index_pro', to: 'events#index_pro'
  get '/orgn/index_pro', to: 'orgns#index_pro'
  get 'foldates/:id/destroy_fd' => 'foldates#destroy', as: :destroy_fd
  get 'folevents/:id/destroy_fe' => 'folevents#destroy', as: :destroy_fe
  get 'folorgs/:id/destroy_fo' => 'folorgs#destroy', as: :destroy_fo
  get 'event/hashtag/:name', to: 'events#hashtags'

end
