Rails.application.routes.draw do
  get 'users', to: 'users#index'
  get 'users/:user_id/posts', to: 'posts#index', as: 'user_posts'
  get 'users/:user_id/posts/:id', to: 'posts#show', as: 'user_post'
  get 'users/:user_id/all_posts', to: 'posts#all_posts', as: 'all_posts_user'
  get 'users/:user_id/recent_posts', to: 'posts#recent', as: 'recent_posts'

  resources :users, only: %i[index show] do
    resources :posts, except: [:index] do
      post 'like', on: :member
      resources :comments, only: [:create]
    end
  end

  root 'users#index'
end
