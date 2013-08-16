Blog::Application.routes.draw do
  scope module: :web do
    resources :users do
      resources :comments
    end

    resources :posts do
      resources :comments
    end

    resource :session

    root to: "welcome#index"
  end
end
