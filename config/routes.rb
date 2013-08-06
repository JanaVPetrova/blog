Blog::Application.routes.draw do
  resources :users do
    resources :posts do
      resources :comments
    end
    resources :comments, only: :index
  end

  root to: "welcome#index"
end
