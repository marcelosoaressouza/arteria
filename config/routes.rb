Arteria::Application.routes.draw do
  devise_for :users

  match 'tagged' => 'home#tagged', :as => 'tagged'

  resources :homes do
    collection do
      get 'search'
    end
  end

  resources :audios do
    collection do
      get 'list'
      get 'view/:id', :action => 'view', :as => 'view'
      get 'search'
    end
  end

  resources :videos do
    collection do
      get 'list'
      get 'view/:id', :action => 'view', :as => 'view'
      get 'search'
    end
  end

  resources :images do
    collection do
      get 'list'
      get 'search'
    end
  end

  resources :galleries do
    collection do
      get 'list'
      get 'search'
    end
  end

  resources :posts do
    collection do
      get 'list'
      get 'search'
    end
  end

  resources :licenses

  match 'tagged' => 'home#tagged', :as => 'tagged'

  mount Ckeditor::Engine => '/ckeditor'

  get "home/index"

  root :to => 'home#index'
end
