Blog::Application.routes.draw do
  resources :users do
    resources :comments
  end

  resources :posts do
    resources :comments
  end

  root to: "welcome#index"
end
