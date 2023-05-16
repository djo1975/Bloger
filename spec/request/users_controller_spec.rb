require 'rails_helper'

RSpec.describe UsersController, type: :request do
  describe 'GET #index' do
    it 'assigns all users to @users' do
      user1 = User.create(name: 'John')
      user2 = User.create(name: 'Jane')

      get '/users'

      expect(assigns(:users)).to eq([user1, user2])
    end

    it 'renders the index template' do
      get '/users'

      expect(response).to render_template(:index)
    end
  end

  describe 'GET #show' do
    it 'assigns the requested user to @user' do
      user = User.create(name: 'John')

      get "/users/#{user.id}"

      expect(assigns(:user)).to eq(user)
    end

    it 'renders the show template' do
      user = User.create(name: 'John')

      get "/users/#{user.id}"

      expect(response).to render_template(:show)
    end
  end
end