require 'rails_helper'
require 'capybara/rspec'

RSpec.describe 'User Index', type: :feature do
  before do
    # Kreiraj testne korisnike
    @user1 = User.create(name: 'John Doe', posts_counter: 3)
    @user2 = User.create(name: 'Jane Smith', posts_counter: 5)
    @user3 = User.create(name: 'Bob Johnson', posts_counter: 2)
    # Postavi profile_picture za testne korisnike
    @user1.update(photo: 'https://example.com/user1.jpg')
    @user2.update(photo: 'https://example.com/user2.jpg')
    @user3.update(photo: 'https://example.com/user3.jpg')

    visit users_path
  end

  it 'displays the username of all other users' do
    expect(page).to have_content(@user1.name)
    expect(page).to have_content(@user2.name)
    expect(page).to have_content(@user3.name)
  end

  it 'displays the profile picture for each user' do
    expect(page).to have_selector("img[src='https://example.com/user1.jpg']")
    expect(page).to have_selector("img[src='https://example.com/user2.jpg']")
    expect(page).to have_selector("img[src='https://example.com/user3.jpg']")
  end

  it 'displays the number of posts each user has written' do
    expect(page).to have_content('Number of posts: 3', count: 1)
    expect(page).to have_content('Number of posts: 5', count: 1)
    expect(page).to have_content('Number of posts: 2', count: 1)
  end

  it 'redirects to the user show page when clicking on a user' do
    user = User.first
    visit users_path
    first(:link, user.name).click
    expect(current_path).to eq(user_path(user))
  end
end
