Arteria::Application.routes.draw do
  devise_for :users

  match 'tagged' => 'home#tagged', :as => 'tagged'

  resources :audios do
    collection do
      get 'list'
      get 'view/:id', :action => 'view', :as => 'view'
    end
  end

  resources :videos do
    collection do
      get 'list'
      get 'view/:id', :action => 'view', :as => 'view'
    end
  end

  resources :images do
    collection do
      get 'list'
    end
  end

  resources :galleries do
    collection do
      get 'list'
    end
  end

  resources :posts do
    collection do
      get 'list'
    end
  end

  resources :licenses

  match 'tagged' => 'home#tagged', :as => 'tagged'

  mount Ckeditor::Engine => '/ckeditor'

  get "home/index"

  root :to => 'home#index'
end
