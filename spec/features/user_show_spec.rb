require 'rails_helper'

RSpec.describe 'User show page:', type: :feature do
  before(:each) do
    @user1 = User.create(name: 'unique_show', photo: 'http://localhost:3000/anything.jpg', bio: 'Anything test',
                         posts_counter: 0)
    @post1 = Post.create(title: 'post four', text: 'post four text', author: @user1, comments_counter: 0,
                         likes_counter: 0)
    @post2 = Post.create(title: 'post three', text: 'post three text', author: @user1, comments_counter: 0,
                         likes_counter: 0)
    @post3 = Post.create(title: 'post two', text: 'post two text', author: @user1, comments_counter: 0,
                         likes_counter: 0)
    @post4 = Post.create(title: 'post one', text: 'post one text', author: @user1, comments_counter: 0,
                         likes_counter: 0)
    @comment1 = Comment.create(text: 'comment one', author: @user1, post: @post1)
    @comment2 = Comment.create(text: 'comment two', author: @user1, post: @post1)
    @comment3 = Comment.create(text: 'comment three', author: @user1, post: @post1)
    @comment4 = Comment.create(text: 'comment four', author: @user1, post: @post1)
    @comment5 = Comment.create(text: 'comment five', author: @user1, post: @post1)
    @like1 = Like.create(author: @user1, post: @post1)
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

  scenario 'When I click a users post, it redirects me to that posts show page' do
    visit user_path(@user1.id)
    click_link(@user1.recent_three_posts.first.title)
    expect(page).to have_current_path(user_post_path(@user1.id, @user1.recent_three_posts.first.id))
  end

  scenario 'When I click the see all posts button, it redirects me to the users posts index page' do
    visit user_path(@user1.id)
    click_link('See All Posts')
    expect(page).to have_current_path(user_posts_path(@user1.id))
  end
end
