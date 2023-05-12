class Comment < ApplicationRecord
  belongs_to :post, foreign_key: 'posts_id'
  belongs_to :author, class_name: 'User'

  validates :text, presence: true

  after_create :increment_post_comments_counter

  def increment_post_comments_counter
    post.increment!(:comments_counter, 1)
  end
end
