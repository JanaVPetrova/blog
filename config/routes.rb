Blog::Application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  scope module: :web do
    resources :users do
      resources :comments
    end

    resources :posts do
      scope module: :posts do
        resources :comments
      end
    end
    resources :subjects, only: [:index, :new, :create, :show]

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
