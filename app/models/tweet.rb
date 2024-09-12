class Tweet < ApplicationRecord
  belongs_to :user
  belongs_to :origin, class_name: 'Tweet', optional: true
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :retweets, class_name: 'Tweet', foreign_key: 'origin_id'

  validates :body, presence: true, length: { minimum: 1, maximum: 280 }, unless: :retweet?
  validates :body, length: { minimum: 1, maximum: 280 }, allow_blank: true
  validates :user_id, presence: true

  def retweet?
    origin_id.present?
  end
end
