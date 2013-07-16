Blog::Application.routes.draw do
  get "welcome/index"

  resources :posts do
    resources :comments
  end

  root to: "welcome#index"
end
