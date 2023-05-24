require 'rails_helper'

RSpec.describe 'User show page:', type: :feature do
  before(:each) do
    @user1 = User.new(name: 'unique_show', photo: 'http://localhost:3000/anything.jpg', bio: 'Anything test',
                      posts_counter: 0)
    @user1.save
    @post1 = Post.new(title: 'post one', text: 'post one text', author: @user1, comments_counter: 0, likes_counter: 0)
    @post2 = Post.new(title: 'post two', text: 'post two text', author: @user1, comments_counter: 0, likes_counter: 0)
    @post3 = Post.new(title: 'post three', text: 'post three text', author: @user1, comments_counter: 0,
                      likes_counter: 0)
    @post4 = Post.new(title: 'post four', text: 'post four text', author: @user1, comments_counter: 0, likes_counter: 0)
    @post1.save
    @post2.save
    @post3.save
    @post4.save
  end
  scenario 'I can see the user profile picture' do
    visit user_path(@user1.id)
    expect(@user1.photo).to match(%r{^http?://.*\.(jpe?g|gif|png)$})
  end
  scenario 'I can see the users username.' do
    visit user_path(@user1.id)
    expect(page).to have_content(@user1.name)
  end
  scenario 'I can see the number of posts the user has written.' do
    visit user_path(@user1.id)
    expect(page).to have_content(@user1.posts.count)
  end
  scenario 'I can see the users bio' do
    visit user_path(@user1.id)
    expect(page).to have_content(@user1.bio)
  end
  scenario 'I can see the users first 3 posts' do
    visit user_path(@user1.id)
    expect(page).to have_content(@user1.recent_three_posts.first.title)
    expect(page).to have_content(@user1.recent_three_posts.second.title)
    expect(page).to have_content(@user1.recent_three_posts.third.title)
  end
  
  scenario 'I can see a button that lets me view all of a user\'s posts' do
    visit user_path(@user1.id)
    expect(page).to have_link('See All Posts', href: user_posts_path(user_id: @user1.id))
  end
  
  scenario 'When I click a user\'s post, it redirects me to that post\'s show page' do
    visit user_path(@user1.id)
    post_id = @user1.recent_three_posts.first.id
    click_link("Post #1") # Promenite naslov posta ako nije "Post #1"
    expect(page).to have_current_path(user_post_path(@user1.id, post_id))
  end
  
  
  
  scenario 'When I click the see all posts button, it redirects me to the users posts index page' do
    visit user_path(@user1.id)
    click_link('See All Posts')
    expect(page).to have_current_path(user_posts_path(@user1.id))
  end
end