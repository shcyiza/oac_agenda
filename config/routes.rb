Rails.application.routes.draw do

  resources :activities
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
  get '/event/index_pro', to: 'events#index_pro'
  get 'foldates/:id/destroy_fd' => 'foldates#destroy', as: :destroy_fd
  get 'folevents/:id/destroy_fe' => 'folevents#destroy', as: :destroy_fe
  get 'folorgs/:id/destroy_fo' => 'folorgs#destroy', as: :destroy_fo
  get 'event/hashtag/:name', to: 'events#hashtags'

end
