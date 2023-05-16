require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe 'GET #index' do
    it 'assigns posts for the user' do
      user = User.create(name: 'John Doe')

      post1 = Post.create(title: 'Post 1', text: 'Lorem ipsum', author: user)
      post2 = Post.create(title: 'Post 2', text: 'Dolor sit amet', author: user)

      get :index, params: { user_id: user.id }

      expect(assigns(:user)).to eq(user)
      expect(assigns(:posts)).to eq([post1, post2])
    end

    it 'renders the index template' do
      user = User.create(name: 'John Doe')

      get :index, params: { user_id: user.id }

      expect(response).to render_template(:index)
    end
  end

  describe 'GET #show' do
    it 'assigns the post and related data' do
      user = User.create(name: 'John Doe')
      post = Post.create(title: 'Post 1', text: 'Lorem ipsum', author: user)

      get :show, params: { user_id: user.id, id: post.id }

      expect(assigns(:user)).to eq(user)
      expect(assigns(:post)).to eq(post)
      expect(assigns(:comments_count)).to eq(0)
      expect(assigns(:likes_count)).to eq(0)
    end

    it 'renders the show template' do
      user = User.create(name: 'John Doe')
      post = Post.create(title: 'Post 1', text: 'Lorem ipsum', author: user)

      get :show, params: { user_id: user.id, id: post.id }

      expect(response).to render_template(:show)
    end
  end
end
