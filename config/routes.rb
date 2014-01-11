Blog::Application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  scope module: :web do
    resources :users do
      resources :comments
    end

    resources :posts, only: [:index, :show] do
      scope module: :posts do
        resources :comments
      end
    end
    resources :subjects, only: [:index, :show]

    resource :session
    resources :welcome, only: [:index]

    root to: "posts#index"

    namespace :admin do
      resources :posts, only: [:index, :new, :create, :edit, :update, :destroy]
      resources :subjects, only: [:index, :new, :create]
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
