class Tweet < ApplicationRecord
  belongs_to :user
  belongs_to :origin, class_name: 'Tweet', optional: true
  has_many :likes
  has_many :comments

  validates :body, presence: true, length: { minimum: 1, maximum: 280 }
end
