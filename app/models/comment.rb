class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :tweet

  validates :body, presence: true, length: { minimum: 5, maximum: 200 }
  validates :user_id, presence: true
  validates :tweet_id, presence: true
end
