Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # get 'users/:user_id/posts', to: 'posts#index', as: 'user_posts'
  # get 'users/:user_id/posts/:id', to: 'posts#show', as: 'user_post'
  # resources :users, only: %i[index show]
  Rails.application.routes.draw do
    get 'users', to: 'users#index'
    get 'users/:id', to: 'users#show', as: 'user'
    get 'users/:user_id/posts', to: 'posts#index', as: 'user_posts'
    get 'users/:user_id/posts/:id', to: 'posts#show', as: 'user_post'
    
    resources :posts
  end
  
  # Defines the root path route ("/")
  # root "articles#index"
end
