Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: 'users#index'
  delete '/users/sign_out', to: 'devise/sessions#destroy'
  # Defines the root path route ("/")
  resources :users, only: [:index, :show, :new, :create] do
    resources :posts, only: [:index, :show, :new, :create, :destroy] do
      resources :comments, :likes
    end
  end

  get "/users/:id", to: "users#show"
  get "/users/:user_id/posts", to: "posts#index"
  get "/users/:user_id/posts/new", to: "posts#new"
  get "/users/:user_id/posts/:id", to: "posts#show"
  post "/users/:user_id/posts/new", to: "posts#create"
  delete '/users/:user_id/posts/:id', to: 'posts#destroy'

    #API routes
    namespace :api do
      resources :users, only: [] do
        resources :posts, only: [:create, :index] do
          resources :comments, only: [:create, :index]
        end
      end
    end
end
