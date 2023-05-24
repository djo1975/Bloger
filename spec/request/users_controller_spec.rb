RSpec.describe UsersController, type: :request do
  # describe 'GET #index' do
  #   it 'assigns all users to @users' do
  #     user1 = User.create(name: 'John')
  #     user2 = User.create(name: 'Jane')

  #     get '/users'

  #     expect(assigns(:users).pluck(:id)).to match_array([user1.id, user2.id])
  #   end
  # end

  describe 'GET #show' do
    it 'assigns the requested user to @user' do
      user = User.create(name: 'John')

      get "/users/#{user.id}"

      expect(assigns(:user).id).to eq(user.id)
    end

    it 'renders the show template' do
      user = User.create(name: 'John')

      get "/users/#{user.id}"

      expect(response).to render_template(:show)
    end
  end
end
