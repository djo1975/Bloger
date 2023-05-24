require 'rails_helper'
require 'capybara/rspec'

RSpec.describe 'Post show page:', type: :feature do
  before(:each) do
    @user1 = User.create(name: 'unique_show', photo: 'http://localhost:3000/anything.jpg', bio: 'Anything test',
                         posts_counter: 0)
    @post1 = Post.create(title: 'post one', text: 'post one text', author: @user1, comments_counter: 0,
                         likes_counter: 0)
    @post2 = Post.create(title: 'post two', text: 'post two text', author: @user1, comments_counter: 0,
                         likes_counter: 0)
    @post3 = Post.create(title: 'post three', text: 'post three text', author: @user1, comments_counter: 0,
                         likes_counter: 0)
    @post4 = Post.create(title: 'post four', text: 'post four text', author: @user1, comments_counter: 0,
                         likes_counter: 0)
    @comment1 = Comment.create(text: 'comment one', author: @user1, post: @post1)
    @comment2 = Comment.create(text: 'comment two', author: @user1, post: @post1)
    @comment3 = Comment.create(text: 'comment three', author: @user1, post: @post1)
    @comment4 = Comment.create(text: 'comment four', author: @user1, post: @post1)
    @comment5 = Comment.create(text: 'comment five', author: @user1, post: @post1)
    @like1 = Like.create(author: @user1, post: @post1)
  end
  scenario 'I can see the posts title.' do
    visit user_post_path(@user1.id, @post1.id)
    expect(page).to have_content(@post1.title)
  end
  scenario 'I can see who wrote the post' do
    visit user_post_path(@user1.id, @post1.id)
    expect(page).to have_content(@post1.author.name)
  end
  scenario 'I can see how many comments it has.' do
    visit user_post_path(@user1.id, @post1.id)
    expect(page).to have_content(@post1.comments.count)
  end
  scenario 'I can see how many likes it has.' do
    visit user_post_path(@user1.id, @post1.id)
    expect(page).to have_content(@post1.likes_counter)
  end
  scenario ' I can see the post body.' do
    visit user_post_path(@user1.id, @post1.id)
    expect(page).to have_content(@post1.text)
  end
  scenario 'I can see the username of each commentor.' do
    visit user_post_path(@user1.id, @post1.id)
    expect(page).to have_content(@comment1.author.name)
    expect(page).to have_content(@comment2.author.name)
    expect(page).to have_content(@comment3.author.name)
    expect(page).to have_content(@comment4.author.name)
    expect(page).to have_content(@comment5.author.name)
  end
  scenario 'I can see the body of each comment.' do
    visit user_post_path(@user1.id, @post1.id)
    expect(page).to have_content(@user1.posts.first.comments.first.text)
    expect(page).to have_content(@user1.posts.first.comments.second.text)
    expect(page).to have_content(@user1.posts.first.comments.third.text)
    expect(page).to have_content(@user1.posts.first.comments.fourth.text)
    expect(page).to have_content(@user1.posts.first.comments.fifth.text)
  end
end
