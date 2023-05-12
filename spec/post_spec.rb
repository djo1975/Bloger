require_relative './rails_helper'

RSpec.describe Post, type: :model do
  let(:user) do
    User.create(
      name: 'Loren',
      photo: 'https://this-person-does-not-exist.com/en/download-page?image=genef4e9868ae582ca3061881b69d8fbeb1',
      posts_counter: 0,
      bio: 'I am Loren, and I love sport.'
    )
  end

  subject do
    described_class.new(
      title: 'My first post',
      author: user,
      text: 'The motivation to become a developer is very big.',
      comments_counter: 0,
      likes_counter: 0
    )
  end

  before { subject.save }

  describe 'Validations' do
    it 'validates presence of title' do
      subject.title = nil
      expect(subject).to_not be_valid
    end

    it 'validates maximum length of title' do
      subject.title = 'a' * 251
      expect(subject).to_not be_valid
    end

    it 'validates comments_counter as an integer greater than or equal to zero' do
      subject.comments_counter = -1
      expect(subject).to_not be_valid

      subject.comments_counter = 0
      expect(subject).to be_valid

      subject.comments_counter = 10
      expect(subject).to be_valid
    end

    it 'validates likes_counter as an integer greater than or equal to zero' do
      subject.likes_counter = -1
      expect(subject).to_not be_valid

      subject.likes_counter = 0
      expect(subject).to be_valid

      subject.likes_counter = 5
      expect(subject).to be_valid
    end
  end
end
