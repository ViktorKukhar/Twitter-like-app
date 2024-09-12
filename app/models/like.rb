class Like < ApplicationRecord
  belongs_to :user
  belongs_to :tweet

  validates :user_id, presence: true, uniqueness: {
    scope: :tweet_id,
    message: 'You can like a tweet only once'
  }
  validates :tweet_id, presence: true
end
