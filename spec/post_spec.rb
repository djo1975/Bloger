require_relative './rails_helper'

RSpec.describe User, type: :model do
  subject do
    User.new(
      name: 'Loren',
      photo: 'https://this-person-does-not-exist.com/en/download-page?image=genef4e9868ae582ca3061881b69d8fbeb1',
      posts_counter: 0,
      bio: 'I am Loren, and I love sport.'
    )
  end

  before { subject.save }

  describe 'Validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid with negative posts_counter' do
      subject.posts_counter = -1
      expect(subject).to_not be_valid
    end
  end

  describe 'Functionality' do
    context 'get recent posts' do
      it 'returns the 3 most recent posts' do
        5.times do |i|
          Post.create(
            title: "Post #{i}",
            author: subject,
            text: 'The motivation to become a developer is very big.',
            comments_counter: 0,
            likes_counter: 0
          )
        end

        expect(subject.recent_three_posts.count).to eq(3)
      end
    end
  end
end
