class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :tweet

  validates :body, presence: true, length: {minimum: 5 , maximum: 200}
end
