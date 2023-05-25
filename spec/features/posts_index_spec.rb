require 'rails_helper'
require 'capybara/rspec'

RSpec.describe 'User post index page:', type: :feature do
  before(:each) do
    @user1 = User.create(name: 'unique_show', photo: 'http://localhost:3000/anything.jpg', bio: 'Anything test',
                         posts_counter: 0)
    puts "Korisnik #{@user1} je kreiran."

    @post1 = Post.create(title: 'post one', text: 'post one text', author: @user1, comments_counter: 0,
                         likes_counter: 0)
    expect(@post1).to be_valid

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

  scenario 'I can see the users profile picture.' do
    visit user_posts_path(@user1.id)
    expect(@user1.photo).to match(%r{^http?://.*\.(jpe?g|gif|png)$})
  end

  scenario 'I can see the users name.' do
    visit user_posts_path(@user1.id)
    expect(page).to have_content(@user1.name)
  end

  scenario 'I can see the number of posts the user has written.' do
    visit user_posts_path(@user1.id)
    expect(page).to have_content(@user1.posts.count)
  end

  scenario 'I can see a posts title.' do
    visit user_posts_path(@user1.id)
    expect(page).to have_content('post four') # Assuming this is the first post
  end

  scenario ' I can see the post body.' do
    visit user_post_path(@user1.id, @post1.id)
    expect(page).to have_content(@post1.text)
  end

  scenario 'I can see the first comments on a post.' do
    visit user_post_path(@user1.id, @post1.id)
    expect(page).to have_content(@post1.comments.first.text)
  end

  scenario 'I can see how many comments a post has.' do
    visit user_post_path(@user1.id, @post1.id)
    expect(page).to have_content(@post1.comments.count)
  end

  scenario 'I can see how many likes it has.' do
    visit user_post_path(@user1.id, @post1.id)
    expect(page).to have_content(@post1.likes_counter)
  end

  scenario 'I can see a section for pagination if there are more posts than fit on the view.' do
    visit user_posts_path(@user1.id)
    expect(page).to have_link('Paginate')
  end

  scenario 'When I click on a post, it redirects me to that posts show page.' do
    visit user_posts_path(@user1.id)
    click_link('post four')
    expect(page).to have_current_path(user_post_path(@user1.id, @user1.posts.fourth.id))
  end
end
