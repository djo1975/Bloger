Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get 'users', to: 'users#index'
  get 'users/:id', to: 'users#show', as: 'user'
  get 'users/:user_id/posts', to: 'posts#index', as: 'user_posts'
  get 'users/:user_id/posts/:id', to: 'posts#show', as: 'user_post'
  get 'users/:user_id/all_posts', to: 'posts#all_posts', as: 'all_posts_user'
  get 'users/:user_id/recent_posts', to: 'posts#recent', as: 'recent_posts'

  resources :posts do
    post 'like', on: :member
  end
  resources :users

  resources :posts
  root 'users#index'
end
