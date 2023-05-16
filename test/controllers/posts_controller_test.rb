# test/controllers/posts_controller_test.rb
require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @post = posts(:one)
    @article = articles(:one)
  end

  test 'should get index' do
    get user_posts_url(@user)
    assert_response :success
    assert_template :index
  end

  test 'should show post' do
    get user_post_url(@user, @post)
    assert_response :success
    assert_template :show
    assert_select 'h1', @post.title
  end

  test 'should get new' do
    get new_article_url
    assert_response :success
  end

  test 'should create article' do
    assert_difference('Article.count') do
      post articles_url, params: { article: {} }
    end
    assert_redirected_to article_url(Article.last)
  end

  test 'should get edit' do
    get edit_article_url(@article)
    assert_response :success
  end

  test 'should update article' do
    patch article_url(@article), params: { article: {} }
    assert_redirected_to article_url(@article)
  end

  test 'should destroy article' do
    assert_difference('Article.count', -1) do
      delete article_url(@article)
    end
    assert_redirected_to articles_url
  end
end
