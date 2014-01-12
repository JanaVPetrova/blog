Blog::Application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  scope module: :web do
    resources :users, only: [:new, :create, :show] do
      resources :comments
    end

    resources :posts, only: [:index, :show] do
      scope module: :posts do
        resources :comments
      end
    end
    resources :subjects, only: [:index, :show] do
      scope module: :subjects do
        resources :posts, only: [:index]
      end
    end

    resource :session
    resources :welcome, only: [:index]

    root to: "subjects#index"

    namespace :admin do
      resources :posts, only: [:index, :new, :create, :edit, :update, :destroy]
      resources :subjects, only: [:index, :new, :create]
      resource :welcome, only: [:show]

      root to: "welcome#show"
    end
  end


  namespace :api do
    resources :posts do
      scope module: :posts do
        resources :comments
      end
    end
  end
end
