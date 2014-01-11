Blog::Application.routes.draw do
  scope module: :web do
    resources :users do
      resources :comments
    end

    resources :posts do
      scope module: :posts do
        resources :comments
      end
    end

    resource :session
    resources :welcome, only: [:index]

    root to: "posts#index"
  end

  namespace :api do
    resources :posts do
      scope module: :posts do
        resources :comments
      end
    end
  end
end
