class Like < ApplicationRecord
  belongs_to :post, counter_cache: true
  belongs_to :author, class_name: 'User'

  after_create :increment_post_likes_counter

  def increment_post_likes_counter
    post.increment_likes_counter
  end
end
