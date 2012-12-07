Arteria::Application.routes.draw do
  devise_for :users

  match 'tagged' => 'home#tagged', :as => 'tagged'

  resources :collections
  resources :audios
  resources :images
  resources :videos
  resources :posts
  resources :licenses
  resources :galleries

  match 'tagged' => 'home#tagged', :as => 'tagged'

  mount Ckeditor::Engine => '/ckeditor'

  get "home/index"

  root :to => 'home#index'
end
