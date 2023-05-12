require_relative './rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) do
    User.create(
      name: 'Loren',
      photo: 'https://this-person-does-not-exist.com/en/download-page?image=genef4e9868ae582ca3061881b69d8fbeb1',
      posts_counter: 0,
      bio: 'I am Loren, and I love sport.'
    )
  end

  let(:post) do
    Post.create(
      title: 'My first post',
      author: user,
      text: 'The motivation to become a developer is very big.',
      comments_counter: 0,
      likes_counter: 0
    )
  end

  subject do
    Comment.new(
      text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      posts_id: post.id,
      author: user
    )
  end

  before { subject.save }

  describe 'Functionality' do
    context 'update comments_counter' do
      before do
        # Reset the post's comments_counter to 0 before running the test
        post.update(comments_counter: 0)
      end

      it 'updates the comments_counter of the post' do
        subject.increment_post_comments_counter
        post.reload
        expect(post.comments_counter).to eq(2)
      end
    end
  end
end
