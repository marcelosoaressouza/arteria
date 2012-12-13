Arteria::Application.routes.draw do
  devise_for :users

  match 'tagged' => 'home#tagged', :as => 'tagged'

  resources :collections
  resources :audios

  resources :galleries do
    collection do
      get 'list'
    end
  end

  resources :images do
    collection do
      get 'list'
    end
  end

  resources :videos
  resources :posts
  resources :licenses

  match 'tagged' => 'home#tagged', :as => 'tagged'

  mount Ckeditor::Engine => '/ckeditor'

  get "home/index"

  root :to => 'home#index'
end
