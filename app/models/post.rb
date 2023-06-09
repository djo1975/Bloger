class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :likes, counter_cache: true
  has_many :comments, foreign_key: 'posts_id'

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  after_create :update_post_counter

  def update_post_counter
    author.increment!(:posts_counter)
  end

  def increment_comments_counter
    increment!(:comments_counter)
  end

  def decrement_comments_counter
    decrement!(:comments_counter)
  end

  def recent_five_comments
    comments.order(created_at: :desc).limit(5)
  end
end
